# Manage PHP.
#
# @example Declaring the class
#   include ::php
#
# @param conf_dir
# @param conf_file
# @param extensions
# @param package_name
# @param settings
#
# @see puppet_classes::php::cli ::php::cli
# @see puppet_classes::php::fpm ::php::fpm
# @see puppet_classes::php::pear ::php::pear
# @see puppet_defined_types::php::extension ::php::extension
# @see puppet_defined_types::php::setting ::php::setting
#
# @since 1.0.0
class php (
  Stdlib::Absolutepath            $conf_dir,
  Stdlib::Absolutepath            $conf_file,
  Hash[String, Hash[String, Any]] $extensions,
  String                          $package_name,
  Hash[String, String]            $settings,
) {

  contain ::php::install
  contain ::php::config

  Class['::php::install'] -> Class['::php::config']
}
