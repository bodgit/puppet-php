# Manage PHP pdo extension.
#
# @example Declaring the class
#   include ::php
#   include ::php::extension::pdo
#
# @param extensions
# @param package_name
# @param settings
#
# @see puppet_classes::php ::php
# @see puppet_defined_types::php::extension ::php::extension
#
# @since 1.0.0
class php::extension::pdo (
  Array[String, 1]     $extensions,
  Optional[String]     $package_name = undef,
  Hash[String, String] $settings     = {},
) {

  ::php::extension { 'pdo':
    extensions   => $extensions,
    package_name => $package_name,
    settings     => $settings,
  }
}
