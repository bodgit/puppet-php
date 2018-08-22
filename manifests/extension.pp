# Define a PHP extension.
#
# @example A sample extension
#   include ::php
#
#   ::php::extension { 'ldap':
#     ensure       => present,
#     package_name => 'php-ldap',
#     extensions   => [
#       'ldap',
#     ],
#     settings     => {
#       'ldap/ldap.max_links' => '-1',
#     },
#   }
#
# @param ensure
# @param package_name
# @param extensions
# @param settings
#
# @see puppet_classes::php ::php
#
# @since 1.0.0
define php::extension (
  Enum['present', 'absent'] $ensure       = 'present',
  Optional[String]          $package_name = undef,
  Array[String, 1]          $extensions   = [
    $title,
  ],
  Hash[String, String]      $settings     = {},
) {

  if ! defined(Class['::php']) {
    fail('You must include the php base class before using any php defined resources')
  }

  if $package_name {
    package { $package_name:
      ensure => $ensure,
    }
  }

  $extensions.each |String $x| {
    $file_ensure = $ensure ? {
      'present' => file,
      default   => 'absent',
    }

    $content = @("EOS"/L)
      ; Enable ${x} extension module
      extension=${x}.so
      | EOS

    file { "${::php::conf_dir}/${x}.ini":
      ensure  => $file_ensure,
      owner   => 0,
      group   => 0,
      mode    => '0644',
      content => $content,
    }

    if $package_name {
      Package[$package_name] -> File["${::php::conf_dir}/${x}.ini"]
    }
  }

  $settings.each |String $setting, String $value| {
    ::php::setting { $setting:
      ensure => $ensure,
      value  => $value,
    }
  }
}
