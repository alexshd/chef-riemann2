default['riemann']['download']['url']       = 'http://aphyr.com/riemann/riemann-0.2.9.tar.bz2'
default['riemann']['download']['checksum']  = '8363e936d5c31d879a7e725e6c8fe41f1a1627b90530a7fb7968aaf4b448ff83'
default['riemann']['download']['version']   = '0.2.9'

default['riemann']['config']['bind']        =   '0.0.0.0'
default['riemann']['config']['port']        =   '5555'
default['riemann']['config']['ws-port']     =   '5556'
default['riemann']['config']['userfile']    =   '/usr/local/riemann/etc/user.config'

default['riemann']['system']['user']        =   'riemann'
default['riemann']['system']['group']       =   'riemann'
default['riemann']['system']['home_dir']    =   '/usr/local/riemann'

default['java']['jdk_version'] = '7'
default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = true

