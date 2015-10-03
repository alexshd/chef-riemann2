# Description

Installs/Configures riemann

# Requirements

## Platform:

* ubuntu
* debian
* centos

## Cookbooks:

* java
* apt
* yum
* ark
* runit
* build-essential

# Attributes

* `node['riemann']['download']['url']` -  Defaults to `http://aphyr.com/riemann/`.
* `node['riemann']['download']['checksum']` -  Defaults to `ec697519e80781dc478983de04204760f2790da1715acfd233b35da071be5455`.
* `node['riemann']['download']['version']` -  Defaults to `0.2.10`.
* `node['riemann']['config']['bind']` -  Defaults to `0.0.0.0`.
* `node['riemann']['config']['port']` -  Defaults to `5555`.
* `node['riemann']['config']['ws-port']` -  Defaults to `5556`.
* `node['riemann']['config']['userfile']` -  Defaults to `/usr/local/riemann/etc/user.config`.
* `node['riemann']['system']['user']` -  Defaults to `riemann`.
* `node['riemann']['system']['group']` -  Defaults to `riemann`.
* `node['riemann']['system']['home_dir']` -  Defaults to `/usr/local/riemann`.
* `node['java']['jdk_version']` -  Defaults to `8`.
* `node['java']['install_flavor']` -  Defaults to `oracle`.
* `node['java']['oracle']['accept_oracle_download_terms']` -  Defaults to `true`.

# Recipes

* riemann2::dash
* riemann2::default
* riemann2::server
* riemann2::tools

# Resources

* [riemann2_riemann_check](#riemann2_riemann_check)

## riemann2_riemann_check

### Actions

- [:nothing]:  Default action.
- nothing:

# License and Maintainer

Maintainer:: Alex Shadrin. (<alex@shdlabs.com>)

License:: Apache 2.0
