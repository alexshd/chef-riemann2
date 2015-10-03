case node[:platform_family]
when 'debian'
  include_recipe 'apt'
when 'rhel'
  include_recipe 'yum'
else
  Chef::Application.fatal!('Platform Not Supported')
end

_conf_dir = ::File.join(
  node['riemann']['system']['home_dir'],
  'etc'
)

include_recipe 'runit'
include_recipe 'java'
include_recipe 'ark'
include_recipe 'riemann2::default'

ark 'riemann' do
  url "#{node['riemann']['download']['url']}riemann-#{node['riemann']['download']['version']}.tar.bz2"
  version node['riemann']['download']['version']
  checksum  node['riemann']['download']['checksum']
  owner node['riemann']['system']['user']
  home_dir node['riemann']['system']['home_dir']
  action :install
end

link '/etc/riemann' do
  to _conf_dir
end

template ::File.join(_conf_dir, 'riemann.config') do
  owner node['riemann']['system']['user']
  group node['riemann']['system']['group']
  source 'riemann.config.erb'
  mode '0644'
  notifies :hup, 'runit_service[riemann-server]'
end

runit_service 'riemann-server'

file node['riemann']['config']['userfile'] do
  owner node['riemann']['system']['user']
  group node['riemann']['system']['group']
  action :create_if_missing
  mode '0644'
end
