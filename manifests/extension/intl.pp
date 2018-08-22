# Manage PHP intl extension.
#
# @example Declaring the class
#   include ::php
#   include ::php::extension::intl
#
# @param extensions
# @param package_name
# @param settings
#
# @see puppet_classes::php ::php
# @see puppet_defined_types::php::extension ::php::extension
#
# @since 1.0.0
class php::extension::intl (
  Array[String, 1]     $extensions,
  Optional[String]     $package_name = undef,
  Hash[String, String] $settings     = {},
) {

  ::php::extension { 'intl':
    extensions   => $extensions,
    package_name => $package_name,
    settings     => $settings,
  }
}
