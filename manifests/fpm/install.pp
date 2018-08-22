# @!visibility private
class php::fpm::install {

  package { $::php::fpm::package_name:
    ensure => present,
  }
}
