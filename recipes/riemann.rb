case node[:platform_family]
when 'debian'
  include_recipe 'apt'
when 'rhel'
  include_recipe 'yum'
else
  Chef::Application.fatal!('Platform Not Supported')
end

include_recipe 'runit'
include_recipe 'java'
include_recipe 'ark'

group node['riemann']['system']['group'] do
  action    :create
end

user node['riemann']['system']['user'] do
  action    :create
  home      node['riemann']['system']['home_dir']
  comment   'Riemann User'
  system    true
  gid       node['riemann']['system']['group']
  shell     '/bin/false'
end

ark 'riemann' do
  url       node['riemann']['download']['url']
  version   node['riemann']['download']['version']
  checksum  node['riemann']['download']['checksum']
  owner     node['riemann']['system']['user']
  home_dir  node['riemann']['system']['home_dir']
  action    :install
end

runit_service 'riemann-server'
conf_dir = ::File.join(node['riemann']['system']['home_dir'], 'etc')

template ::File.join(conf_dir, 'riemann.config') do
  owner     node['riemann']['system']['user']
  group     node['riemann']['system']['group']
  source    'riemann.config.erb'
  mode      '0644'
end

file , ::File.join(conf_dir, 'user.config') do
  owner     node['riemann']['system']['user']
  group     node['riemann']['system']['group']
  action    :create
  mode      '0644'
end

link "/etc/riemann" do
  to conf_dir
end
