# Description

Installs/Configures riemann

# Requirements

## Platform:

* Ubuntu
* Debian
* Centos

## Cookbooks:

* java
* apt
* yum
* ark
* runit
* build-essential

# Attributes

* `node['riemann']['download']['url']` -  Defaults to `http://aphyr.com/riemann/`.
* `node['riemann']['download']['checksum']` -  Defaults to `8363e936d5c31d879a7e725e6c8fe41f1a1627b90530a7fb7968aaf4b448ff83`.
* `node['riemann']['download']['version']` -  Defaults to `0.2.9`.
* `node['riemann']['config']['bind']` -  Defaults to `0.0.0.0`.
* `node['riemann']['config']['port']` -  Defaults to `5555`.
* `node['riemann']['config']['ws-port']` -  Defaults to `5556`.
* `node['riemann']['config']['userfile']` -  Defaults to `/usr/local/riemann/etc/user.config`.
* `node['riemann']['system']['user']` -  Defaults to `riemann`.
* `node['riemann']['system']['group']` -  Defaults to `riemann`.
* `node['riemann']['system']['home_dir']` -  Defaults to `/usr/local/riemann`.
* `node['java']['jdk_version']` -  Defaults to `7`.
* `node['java']['install_flavor']` -  Defaults to `oracle`.
* `node['java']['oracle']['accept_oracle_download_terms']` -  Defaults to `true`.

# Recipes

* riemann2::dash
* riemann2::default
* riemann2::server
* riemann2::tools

# License and Maintainer

Maintainer:: Fewbytes. (<alex@fewbytes.com>)

License:: Apache 2.0
