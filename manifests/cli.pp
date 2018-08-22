# Manage PHP CLI.
#
# @example Declaring the class
#   include ::php
#   include ::php::cli
#
# @param package_name
#
# @see puppet_classes::php ::php
#
# @since 1.0.0
class php::cli (
  String $package_name,
) {

  if ! defined(Class['::php']) {
    fail('You must include the php base class before using the php::cli class')
  }

  package { $package_name:
    ensure => present,
  }
}
