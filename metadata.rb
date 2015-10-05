name             'riemann2'
maintainer       'Alex Shadrin.'
maintainer_email 'alex@shdlabs.com'
license          'Apache 2.0'
description      'Installs/Configures riemann, riemann-dash and rienann-tools'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url       'https://github.com/alexshd/chef-riemann2.git'
version          '0.3.7'

recipe 'riemann2::infra', "creating user and group, included in the `server` and `dash` recipes"
recipe 'riemann2::server',  "installs riemann server, setting 2 config files => default ( riemann.conf ) and user.conf, for custumisations"
recipe 'riemann2::dash',    "install `riemann-dash` with `config.rb` and `config.json` from templates"
recipe 'riemann2::tools',   "installs `riemann-tools`"

supports 'ubuntu'
supports 'debian'
supports 'centos'

depends 'java'
depends 'apt'
depends 'yum'
depends 'ark'
depends 'runit'
depends 'build-essential'
