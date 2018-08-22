require 'spec_helper_acceptance'

describe 'php' do

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

      include ::epel

      Class['::epel'] -> Class['::php::extension::mssql']
    EOS

    # Second run will purge unmanaged settings
    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes:  true)
  end

  describe package('php-common') do
    it { is_expected.to be_installed }
  end

  describe file('/etc/php.ini') do
    it { is_expected.to be_file }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    it { is_expected.to be_mode 644 }
  end

  describe file('/etc/php.d') do
    it { is_expected.to be_directory }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    it { is_expected.to be_mode 755 }
  end

  %w(curl fileinfo gd intl json ldap mbstring mssql pdo_dblib mysql mysqli pdo_mysql pdo pdo_sqlite sqlite3 pgsql pdo_pgsql phar posix sysvmsg sysvsem sysvshm dom wddx xmlreader xmlwriter xsl zip).each do |x|
    describe file("/etc/php.d/#{x}.ini") do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_grouped_into 'root' }
      it { is_expected.to be_mode 644 }
      its(:content) { is_expected.to match %r{(?mx) ^ extension = #{x} \.so $} }
    end
  end

  %w(gd intl ldap mbstring mssql mysql pdo pgsql process pspell xml).each do |x|
    describe package("php-#{x}") do
      it { is_expected.to be_installed }
    end
  end
end
