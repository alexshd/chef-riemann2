default['riemann']['download']['url']       = 'http://aphyr.com/riemann/'
default['riemann']['download']['checksum']  = 'ec697519e80781dc478983de04204760f2790da1715acfd233b35da071be5455'
default['riemann']['download']['version']   = '0.2.10'

default['riemann']['config']['bind']        =   '0.0.0.0'
default['riemann']['config']['port']        =   '5555'
default['riemann']['config']['ws-port']     =   '5556'
default['riemann']['config']['userfile']    =
                  '/usr/local/riemann/etc/user.config'

default['riemann']['system']['user']        =   'riemann'
default['riemann']['system']['group']       =   'riemann'
default['riemann']['system']['home_dir']    =   '/usr/local/riemann'

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = true

default['riemann']['server']['ip'] = ''