# Description

Installs/Configures riemann, riemann-dash and rienann-tools

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
* `node['riemann']['server']['ip']` -  Defaults to ``.
* `node['riemann']['server']['ip']` -  Defaults to ``.
* `node['riemann']['server']['port']` -  Defaults to ``.

# Recipes

* [riemann2::infra](#riemann2infra) - creating user and group, included in the `server` and `dash` recipes
* [riemann2::server](#riemann2server) - installs riemann server, setting 2 config files => default ( riemann.conf ) and user.conf, for custumisations
* [riemann2::dash](#riemann2dash) - install `riemann-dash` with `config.rb` and `config.json` from templates
* [riemann2::tools](#riemann2tools) - installs `riemann-tools`

## riemann2::infra

Configure user and group for riemann-servie and riemann-dash

## riemann2::server

Installs `riemann-server` with `/usr/local/riemann/etc/user.config` for manual changes to rieman-server.

TODO:

  - add temlate `riemann-chef.config` to include configuration from the cookbook.


## riemann2::dash

Installs `riemann-dash` with `config.rb` and `config.json`

TODO:

  - add dynamic variables to the config files

## riemann2::tools

Installs `riemann-tools`.

Using the chef ruby

# Resources

* [riemann2_check](#riemann2_check) - This creates and destroy the riemann-health service.

## riemann2_check

This creates and destroy the riemann-health service.

### Actions

- [:create]:  Default action.
- create: Create the `riemann-health` service.
- destroy: Destroy the `riemann-health` service.
- nothing:
- restart:

### Attribute Parameters

- check_name:
- server:  Defaults to <code>"localhost"</code>.
- port:  Defaults to <code>"5555"</code>.
- tags:

### Examples

    # riemann-health
    riemann2::check "health" do
      action :create
      server node['riemann']['server']['ip']
      port   '5555'
    end

# License and Maintainer

Maintainer:: Alex Shadrin. (<alex@shdlabs.com>)
Source:: https://github.com/alexshd/chef-riemann2.git

License:: Apache 2.0
