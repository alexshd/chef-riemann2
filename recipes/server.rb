#
# Cookbook Name:: riemann2
# Recipe:: server
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
=begin
#<
Installs `riemann-server` with `/usr/local/riemann/etc/user.config` for manual changes to rieman-server.


TODO: 

  - add temlate `riemann-chef.config` to include configuration from the cookbook.
  
#>
=end

case node['platform_family']
when 'debian'
  include_recipe 'apt'
when 'rhel'
  include_recipe 'yum'
else
  log 'Platform Not Supported'
  exit 1
end

conf_dir = ::File.join(
  node['riemann']['system']['home_dir'],
  'etc'
)

include_recipe 'runit'
include_recipe 'java'
include_recipe 'ark'
include_recipe 'riemann2::infra'

ark 'riemann' do
  url "#{node['riemann']['download']['url']}riemann-#{node['riemann']['download']['version']}.tar.bz2"
  version node['riemann']['download']['version']
  checksum node['riemann']['download']['checksum']
  owner node['riemann']['system']['user']
  home_dir node['riemann']['system']['home_dir']
  action :install
end

link '/etc/riemann' do
  to conf_dir
end

template ::File.join(conf_dir, 'riemann.config') do
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

node.default['riemann']['server']['ip']   = node['ipaddress']
node.default['riemann']['server']['port']  = node['riemann']['config']['port']
