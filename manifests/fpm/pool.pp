# Define a pool of FPM workers.
#
# @example An example pool
#   include ::php
#   include ::php::fpm
#
#   ::php::fpm::pool { 'test':
#     listen          => '/var/run/php-fpm/test.sock',
#     pm              => 'static',
#     pm_max_children => 5,
#     user            => 'nobody',
#   }
#
# @param listen
# @param pm
# @param pm_max_children
# @param user
# @param pool
# @param listen_backlog
# @param listen_allowed_clients
# @param listen_owner
# @param listen_group
# @param listen_mode
# @param group
# @param pm_start_servers
# @param pm_min_spare_servers
# @param pm_max_spare_servers
# @param pm_max_requests
# @param pm_status_path
# @param ping_path
# @param ping_response
# @param request_terminate_timeout
# @param request_slowlog_timeout
# @param slowlog
# @param rlimit_files
# @param rlimit_core
# @param chroot
# @param chdir
# @param catch_workers_output
# @param security_limit_extensions
# @param env
# @param php_flag
# @param php_value
# @param php_admin_flag
# @param php_admin_value
#
# @see puppet_classes::php::fpm ::php::fpm
#
# @since 1.0.0
define php::fpm::pool (
  PHP::Type::FPM::Listen                           $listen,
  Enum['static', 'dynamic']                        $pm,
  Integer[0]                                       $pm_max_children,
  String                                           $user,
  String                                           $pool                      = $title,
  Optional[Integer[-1]]                            $listen_backlog            = undef,
  Optional[Array[IP::Address::V4::NoSubnet, 1]]    $listen_allowed_clients    = undef,
  Optional[String]                                 $listen_owner              = undef,
  Optional[String]                                 $listen_group              = undef,
  Optional[Pattern[/(?x) ^ [0-7]{4} $/]]           $listen_mode               = undef,
  Optional[String]                                 $group                     = undef,
  Optional[Integer[0]]                             $pm_start_servers          = undef,
  Optional[Integer[0]]                             $pm_min_spare_servers      = undef,
  Optional[Integer[0]]                             $pm_max_spare_servers      = undef,
  Optional[Integer[0]]                             $pm_max_requests           = undef,
  Optional[Stdlib::Unixpath]                       $pm_status_path            = undef,
  Optional[Stdlib::Unixpath]                       $ping_path                 = undef,
  Optional[String]                                 $ping_response             = undef,
  Optional[PHP::Type::FPM::Timeout]                $request_terminate_timeout = undef,
  Optional[PHP::Type::FPM::Timeout]                $request_slowlog_timeout   = undef,
  Optional[Stdlib::Absolutepath]                   $slowlog                   = undef,
  Optional[Integer[0]]                             $rlimit_files              = undef,
  Optional[Variant[Enum['unlimited'], Integer[0]]] $rlimit_core               = undef,
  Optional[Stdlib::Absolutepath]                   $chroot                    = undef,
  Optional[Stdlib::Absolutepath]                   $chdir                     = undef,
  Optional[Boolean]                                $catch_workers_output      = undef,
  Optional[Array[Pattern[/(?x) ^ \. \w+ $/], 1]]   $security_limit_extensions = undef,
  Hash[String, String]                             $env                       = {},
  Hash[String, Boolean]                            $php_flag                  = {},
  Hash[String, String]                             $php_value                 = {},
  Hash[String, Boolean]                            $php_admin_flag            = {},
  Hash[String, String]                             $php_admin_value           = {},
) {

  if ! defined(Class['::php::fpm']) {
    fail('You must include the php::fpm base class before using any php::fpm defined resources')
  }

  file { "${::php::fpm::conf_dir}/${pool}.conf":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template("${module_name}/pool.conf.erb"),
    notify  => Class['::php::fpm::service'],
  }
}
