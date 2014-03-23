include_recipe 'build-essential'
include_recipe 'rvm::system'
include_recipe 'runit'

gem_package 'riemann-tools' do
  action      :install
  gem_binary  'gem'
end