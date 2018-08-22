# Manage PHP Extension and Application Repository framework.
#
# @example Declaring the class
#   include ::php
#   include ::php::pear
#
# @param package_name
#
# @see puppet_classes::php ::php
#
# @since 1.0.0
class php::pear (
  String $package_name,
) {

  if ! defined(Class['::php']) {
    fail('You must include the php base class before using the php::pear class')
  }

  package { $package_name:
    ensure => present,
  }
}
