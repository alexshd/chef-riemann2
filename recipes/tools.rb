include_recipe 'build-essential'
include_recipe 'runit'

package %w( libxml lobxstl zlib1g-dev )

gem_package 'riemann-tools' do
  action :install
  gem_binary 'gem'
end

