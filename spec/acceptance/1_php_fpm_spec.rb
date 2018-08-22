require 'spec_helper_acceptance'

describe 'php::fpm' do

  it 'should work with no errors' do

    pp = <<-EOS
      include ::php
      include ::php::extension::curl
      include ::php::extension::fileinfo
      include ::php::extension::gd
      include ::php::extension::intl
      include ::php::extension::json
      include ::php::extension::ldap
      include ::php::extension::mbstring
      include ::php::extension::mssql
      include ::php::extension::mysql
      include ::php::extension::pdo
      include ::php::extension::pgsql
      include ::php::extension::phar
      include ::php::extension::process
      include ::php::extension::pspell
      include ::php::extension::xml
      include ::php::extension::zip
      include ::php::fpm

      ::php::fpm::pool { 'www':
        listen          => '/var/run/php-fpm/www.sock',
        pm              => 'static',
        pm_max_children => 2,
        listen_owner    => 'root',
        listen_group    => 'root',
        listen_mode     => '0666',
        user            => 'nobody',
      }

      file { '/index.php':
        ensure  => file,
        owner   => 0,
        group   => 0,
        mode    => '0644',
        content => "<?php phpinfo(); ?>\n",
      }

      include ::epel

      package { 'fcgi':
        ensure  => present,
        require => Class['::epel'],
      }

      Class['::epel'] -> Class['::php::extension::mssql']
    EOS

    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes:  true)
  end

  describe package('php-fpm') do
    it { is_expected.to be_installed }
  end

  describe file('/etc/php-fpm.conf') do
    it { is_expected.to be_file }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    it { is_expected.to be_mode 644 }
  end

  describe file('/etc/php-fpm.d') do
    it { is_expected.to be_directory }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    it { is_expected.to be_mode 755 }
  end

  describe file('/etc/php-fpm.d/www.conf') do
    it { is_expected.to be_file }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    it { is_expected.to be_mode 644 }
  end

  describe service('php-fpm') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe file('/var/run/php-fpm/www.sock') do
    it { is_expected.to be_socket }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    it { is_expected.to be_mode 666 }
  end

  describe package('fcgi') do
    it { is_expected.to be_installed }
  end

  describe command('SCRIPT_FILENAME=/index.php QUERY_STRING= REQUEST_METHOD=GET cgi-fcgi -bind -connect /var/run/php-fpm/www.sock') do
    its(:exit_status) { is_expected.to eq 0 }
    its(:stdout) { is_expected.to match %r{(?mx) > Server \s API \s < .+ > FPM/FastCGI \s <} }

    %w(curl fileinfo gd intl json ldap mbstring mssql pdo_dblib mysql mysqli pdo_mysql pdo pdo_sqlite sqlite3 pgsql pdo_pgsql phar posix sysvmsg dom wddx xmlreader xmlwriter xsl zip).each do |x|
      its(:stdout) { is_expected.to match %r{(?imx) " module_#{x} "> #{x} <} }
    end
  end
end
