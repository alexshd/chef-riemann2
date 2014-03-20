case node[:platform_family]
when 'debian'
  package 'vim-gtk'
when 'rhel'
  package 'vim-enhanced'
else
  Chef::Application.fatal!('Platform Not Supported')
end

package 'mlocate'
