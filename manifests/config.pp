# @!visibility private
class php::config {

  file { $::php::conf_file:
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => '0644',
  }

  file { $::php::conf_dir:
    ensure       => directory,
    owner        => 0,
    group        => 0,
    mode         => '0644',
    purge        => true,
    recurse      => true,
    recurselimit => 1,
  }

  $::php::extensions.each |$instance, $attributes| {
    Resource['class'] {
      "::php::extension::${instance}": * => $attributes;
    }
  }

  resources { 'php_ini_setting':
    purge => true,
  }

  $::php::settings.each |$setting, $value| {
    ::php::setting { $setting:
      value => $value,
    }
  }
}
