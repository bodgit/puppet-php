# Manage PHP mbstring extension.
#
# @example Declaring the class
#   include ::php
#   include ::php::extension::mbstring
#
# @param extensions
# @param package_name
# @param settings
#
# @see puppet_classes::php ::php
# @see puppet_defined_types::php::extension ::php::extension
#
# @since 1.0.0
class php::extension::mbstring (
  Array[String, 1]     $extensions,
  Optional[String]     $package_name = undef,
  Hash[String, String] $settings     = {},
) {

  ::php::extension { 'mbstring':
    extensions   => $extensions,
    package_name => $package_name,
    settings     => $settings,
  }
}
