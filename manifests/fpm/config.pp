# @!visibility private
class php::fpm::config {

  $conf_dir                    = $::php::fpm::conf_dir
  $daemonize                   = $::php::fpm::daemonize
  $emergency_restart_interval  = $::php::fpm::emergency_restart_interval
  $emergency_restart_threshold = $::php::fpm::emergency_restart_threshold
  $error_log                   = $::php::fpm::error_log
  $log_level                   = $::php::fpm::log_level
  $pid                         = $::php::fpm::pid
  $process_control_timeout     = $::php::fpm::process_control_timeout

  file { $::php::fpm::conf_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template("${module_name}/php-fpm.conf.erb"),
  }

  file { $conf_dir:
    ensure       => directory,
    owner        => 0,
    group        => 0,
    mode         => '0644',
    purge        => true,
    recurse      => true,
    recurselimit => 1,
  }

  $::php::fpm::pools.each |$resource, $attributes| {
    ::php::fpm::pool { $resource:
      * => $attributes,
    }
  }
}
