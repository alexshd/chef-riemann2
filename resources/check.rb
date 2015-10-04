=begin
#<
This creates and destroy the riemann-health service.
@action create  Create the `riemann-health` service.
@action destroy Destroy the `riemann-health` service.

@section Examples

    # An example of my awesome service
    riemann2::check "health" do
      action :create
    end
#>
=end


actions :create, :start, :destroy

attribute :check_name, name_attribute: true,  kind_of: String
# attribute :server,     default: 'localhost',  kind_of: String, required: true
# attribute :port,       default: 5555,         kind_of: Fixnum
# attribute :tags,       kind_of: Array