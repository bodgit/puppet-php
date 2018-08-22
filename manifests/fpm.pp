# Manage PHP FastCGI Process Manager.
#
# @example Declaring the class
#   include ::php
#   include ::php::fpm
#
# @param conf_dir
# @param conf_file
# @param package_name
# @param service_name
# @param daemonize
# @param emergency_restart_interval
# @param emergency_restart_threshold
# @param error_log
# @param log_level
# @param pid
# @param process_control_timeout
# @param pools
#
# @see puppet_classes::php ::php
# @see puppet_defined_types::php::fpm::pool ::php::fpm::pool
#
# @since 1.0.0
class php::fpm (
  Stdlib::Absolutepath                                           $conf_dir,
  Stdlib::Absolutepath                                           $conf_file,
  String                                                         $package_name,
  String                                                         $service_name,
  Optional[Boolean]                                              $daemonize                   = undef,
  Optional[PHP::Type::FPM::Timeout]                              $emergency_restart_interval  = undef,
  Optional[Integer[0]]                                           $emergency_restart_threshold = undef,
  Optional[Stdlib::Absolutepath]                                 $error_log                   = undef,
  Optional[Enum['alert', 'error', 'warning', 'notice', 'debug']] $log_level                   = undef,
  Optional[Stdlib::Absolutepath]                                 $pid                         = undef,
  Optional[PHP::Type::FPM::Timeout]                              $process_control_timeout     = undef,
  Hash[String, Hash[String, Any]]                                $pools                       = {},
) {

  if ! defined(Class['::php']) {
    fail('You must include the php base class before using the php::fpm class')
  }

  contain ::php::fpm::install
  contain ::php::fpm::config
  contain ::php::fpm::service

  Class['::php::fpm::install'] -> Class['::php::fpm::config']
    ~> Class['::php::fpm::service']

  ::Php::Extension <||> ~> Class['::php::fpm::service'] # lint:ignore:spaceship_operator_without_tag
  ::Php::Setting <||> ~> Class['::php::fpm::service'] # lint:ignore:spaceship_operator_without_tag
  Resources['php_ini_setting'] ~> Class['::php::fpm::service']
}
