# @!visibility private
class php::fpm::service {

  service { $::php::fpm::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
