use_inline_resources

action :create do
  
  resource_name = "riemann-#{new_resource.name}"

  runit_service resource_name

  log "My name is #{new_resource.name}"
end