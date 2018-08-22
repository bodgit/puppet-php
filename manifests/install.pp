# @!visibility private
class php::install {

  package { $::php::package_name:
    ensure => present,
  }
}
