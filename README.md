# php

Tested with Travis CI

[![Build Status](https://travis-ci.org/bodgit/puppet-php.svg?branch=master)](https://travis-ci.org/bodgit/puppet-php)
[![Coverage Status](https://coveralls.io/repos/bodgit/puppet-php/badge.svg?branch=master&service=github)](https://coveralls.io/github/bodgit/puppet-php?branch=master)
[![Puppet Forge](http://img.shields.io/puppetforge/v/bodgit/php.svg)](https://forge.puppetlabs.com/bodgit/php)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with php](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with php](#beginning-with-php)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module manages PHP and the FastCGI Process Manager.

CentOS, RHEL, Scientific and Oracle Enterprise Linux is supported using Puppet
4.6.0 or later.

## Setup

### Setup Requirements

On RHEL/CentOS platforms you may need to have access to the EPEL repository
for some of the additional PHP extensions by using
[stahnma/epel](https://forge.puppet.com/stahnma/epel) or by other means.
If you wish to use a version of PHP shipped in a Software Collection then you
will need access to the SCL repository using
[bodgit/scl](https://forge.puppet.com/bodgit/scl) or similar.

### Beginning with php

In the very simplest case, you can just include the following which mimics the
default installation and extensions:

```puppet
include ::php
```

## Usage

Additional extensions are available, so if you need MySQL support:

```puppet
include ::php
include ::php::extension::mysql
```

The FastCGI Process Manager can be installed and multiple pools can be
configured:

```puppet
include ::php
include ::php::fpm

::php::fpm::pool { 'www':
  listen          => '/var/run/php-fpm/www.sock',
  pm              => 'static',
  pm_max_children => 10,
  user            => 'apache',
}
```

## Reference

The reference documentation is generated with
[puppet-strings](https://github.com/puppetlabs/puppet-strings) and the latest
version of the documentation is hosted at
[https://bodgit.github.io/puppet-php/](https://bodgit.github.io/puppet-php/).

## Limitations

This module has been built on and tested against Puppet 4.6.0 and higher.

The module has been tested on:

* CentOS Enterprise Linux 6/7

This module doesn't install or configure `mod_php` for Apache however the
`apache::mod::php` class should work in combination with this module.

## Development

The module has both [rspec-puppet](http://rspec-puppet.com) and
[beaker-rspec](https://github.com/puppetlabs/beaker-rspec) tests. Run them
with:

```
$ bundle exec rake test
$ PUPPET_INSTALL_TYPE=agent PUPPET_INSTALL_VERSION=x.y.z bundle exec rake beaker:<nodeset>
```

Please log issues or pull requests at
[github](https://github.com/bodgit/puppet-php).
