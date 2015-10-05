=begin
#<
This creates and destroy the riemann-health service.
@action create  Create the `riemann-health` service.
@action destroy Destroy the `riemann-health` service.

@section Examples

    # riemann-health 
    riemann2::check "health" do
      action :create
      server node['riemann']['server']['ip']
      port   '5555'
    end
#>
=end


actions :create, :restart, :destroy
default_action :create

attribute :check_name, name_attribute: true,  kind_of: String
attribute :server,     default: 'localhost',  kind_of: String, required: true
attribute :port,       default: '5555',         kind_of: String
attribute :tags,       kind_of: Array
