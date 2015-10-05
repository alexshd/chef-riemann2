#
# Cookbook Name:: riemann2
# Recipe:: tools
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
=begin
#<
Installs `riemann-tools`. 

Using the chef ruby
#>
=end

include_recipe 'build-essential'
include_recipe 'runit'

package %w( libxml2 libxslt1.1 zlib1g-dev )

chef_gem 'riemann-tools' do
  compile_time false
end
