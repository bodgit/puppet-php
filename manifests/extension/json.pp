# Manage PHP json extension.
#
# @example Declaring the class
#   include ::php
#   include ::php::extension::json
#
# @param extensions
# @param package_name
# @param settings
#
# @see puppet_classes::php ::php
# @see puppet_defined_types::php::extension ::php::extension
#
# @since 1.0.0
class php::extension::json (
  Array[String, 1]     $extensions,
  Optional[String]     $package_name = undef,
  Hash[String, String] $settings     = {},
) {

  ::php::extension { 'json':
    extensions   => $extensions,
    package_name => $package_name,
    settings     => $settings,
  }
}
