include_recipe 'runit'

chef_gem 'riemann-dash' do
  action      :install
end
