#
# Cookbook Name:: riemann2
# Recipe:: infra
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
=begin
#<
Configure user and group for riemann-servie and riemann-dash
#>
=end
group node['riemann']['system']['group'] do
  action :create
end

user node['riemann']['system']['user'] do
  action :create
  home node['riemann']['system']['home_dir']
  comment 'Riemann User'
  system true
  gid node['riemann']['system']['group']
  shell '/bin/false'
end
