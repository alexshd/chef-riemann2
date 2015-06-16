#
# Cookbook Name:: riemann2
# Recipe::dash
#
include_recipe 'runit'

chef_gem 'riemann-dash' do
  action :install
end

directory '/opt/riemann2/dash' do
  owner 'root'
  group 'root'
  mode '0755'
  path 'name'
  recursive true
  action :create
end

template '/opt/riemann2/dash/config.rb' do
  source 'config.rb.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
