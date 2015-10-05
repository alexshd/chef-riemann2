#
# Cookbook Name:: riemann2
# Recipe:: dash
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
=begin
#<
Installs `riemann-dash` with `config.rb` and `config.json`

TODO: 

  - add dynamic variables to the config files
#>
=end

include_recipe 'runit'
include_recipe 'riemann2::infra'

chef_gem 'riemann-dash' do
  compile_time false
  action :install
end

directory '/opt/riemann2/dash' do
  owner node['riemann']['system']['user']
  group node['riemann']['system']['group']
  mode '0755'
  recursive true
  action :create
end

%w( config.rb config.json).each do |config_file|
  template "/opt/riemann2/dash/#{config_file}" do
    source "#{config_file}.erb"
    owner node['riemann']['system']['user']
    group node['riemann']['system']['group']
    mode '0644'
    action :create_if_missing
  end
end

runit_service 'riemann-dash'
