name             'riemann'
maintainer       'Fewbytes.'
maintainer_email 'alex@fewbytes.com'
license          'Apache 2.0'
description      'Installs/Configures riemann'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'
supports 'debian'
supports 'centos'

depends 'java'
depends 'apt'
depends 'ark'
depends 'runit'
depends 'rvm', '~> 0.9.0'
depends 'build-essential'
