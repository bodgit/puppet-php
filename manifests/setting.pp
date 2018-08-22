# Define PHP settings in the php.ini file.
#
# @example A sample setting
#   include ::php
#
#   ::php::setting { 'PHP/engine':
#     value => 'On',
#   }
#
# @param value
# @param ensure
# @param setting
#
# @see puppet_classes::php ::php
#
# @since 1.0.0
define php::setting (
  String                    $value,
  Enum['present', 'absent'] $ensure  = 'present',
  String                    $setting = $title,
) {

  if ! defined(Class['::php']) {
    fail('You must include the php base class before using any php defined resources')
  }

  php_ini_setting { $setting:
    ensure => $ensure,
    value  => $value,
  }
}
