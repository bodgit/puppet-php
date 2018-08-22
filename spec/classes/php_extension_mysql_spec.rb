require 'spec_helper'

describe 'php::extension::mysql' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'without php class included' do
        it { is_expected.to compile.and_raise_error(/must include the php base class/) }
      end

      context 'with php class included' do
        let(:pre_condition) do
          'include ::php'
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file('/etc/php.d/mysql.ini') }
        it { is_expected.to contain_file('/etc/php.d/mysqli.ini') }
        it { is_expected.to contain_file('/etc/php.d/pdo_mysql.ini') }
        it { is_expected.to contain_package('php-mysql') }
        it { is_expected.to contain_php_ini_setting('MySQL/mysql.allow_persistent') }
        it { is_expected.to contain_php_ini_setting('MySQL/mysql.connect_timeout') }
        it { is_expected.to contain_php_ini_setting('MySQL/mysql.default_host') }
        it { is_expected.to contain_php_ini_setting('MySQL/mysql.default_password') }
        it { is_expected.to contain_php_ini_setting('MySQL/mysql.default_port') }
        it { is_expected.to contain_php_ini_setting('MySQL/mysql.default_socket') }
        it { is_expected.to contain_php_ini_setting('MySQL/mysql.default_user') }
        it { is_expected.to contain_php_ini_setting('MySQL/mysql.max_links') }
        it { is_expected.to contain_php_ini_setting('MySQL/mysql.max_persistent') }
        it { is_expected.to contain_php_ini_setting('MySQL/mysql.trace_mode') }
        it { is_expected.to contain_php_ini_setting('MySQLi/mysqli.default_host') }
        it { is_expected.to contain_php_ini_setting('MySQLi/mysqli.default_port') }
        it { is_expected.to contain_php_ini_setting('MySQLi/mysqli.default_pw') }
        it { is_expected.to contain_php_ini_setting('MySQLi/mysqli.default_socket') }
        it { is_expected.to contain_php_ini_setting('MySQLi/mysqli.default_user') }
        it { is_expected.to contain_php_ini_setting('MySQLi/mysqli.max_links') }
        it { is_expected.to contain_php_ini_setting('MySQLi/mysqli.reconnect') }
        it { is_expected.to contain_php__extension('mysql') }
        it { is_expected.to contain_php__setting('MySQL/mysql.allow_persistent') }
        it { is_expected.to contain_php__setting('MySQL/mysql.connect_timeout') }
        it { is_expected.to contain_php__setting('MySQL/mysql.default_host') }
        it { is_expected.to contain_php__setting('MySQL/mysql.default_password') }
        it { is_expected.to contain_php__setting('MySQL/mysql.default_port') }
        it { is_expected.to contain_php__setting('MySQL/mysql.default_socket') }
        it { is_expected.to contain_php__setting('MySQL/mysql.default_user') }
        it { is_expected.to contain_php__setting('MySQL/mysql.max_links') }
        it { is_expected.to contain_php__setting('MySQL/mysql.max_persistent') }
        it { is_expected.to contain_php__setting('MySQL/mysql.trace_mode') }
        it { is_expected.to contain_php__setting('MySQLi/mysqli.default_host') }
        it { is_expected.to contain_php__setting('MySQLi/mysqli.default_port') }
        it { is_expected.to contain_php__setting('MySQLi/mysqli.default_pw') }
        it { is_expected.to contain_php__setting('MySQLi/mysqli.default_socket') }
        it { is_expected.to contain_php__setting('MySQLi/mysqli.default_user') }
        it { is_expected.to contain_php__setting('MySQLi/mysqli.max_links') }
        it { is_expected.to contain_php__setting('MySQLi/mysqli.reconnect') }

        case facts[:os]['release']['major']
        when '6'
          # noop
        else
          it { is_expected.to contain_php_ini_setting('MySQL/mysql.allow_local_infile') }
          it { is_expected.to contain_php_ini_setting('MySQL/mysql.cache_size') }
          it { is_expected.to contain_php_ini_setting('MySQLi/mysqli.allow_persistent') }
          it { is_expected.to contain_php_ini_setting('MySQLi/mysqli.cache_size') }
          it { is_expected.to contain_php_ini_setting('MySQLi/mysqli.max_persistent') }
          it { is_expected.to contain_php_ini_setting('Pdo_mysql/pdo_mysql.cache_size') }
          it { is_expected.to contain_php_ini_setting('Pdo_mysql/pdo_mysql.default_socket') }
          it { is_expected.to contain_php__setting('MySQL/mysql.allow_local_infile') }
          it { is_expected.to contain_php__setting('MySQL/mysql.cache_size') }
          it { is_expected.to contain_php__setting('MySQLi/mysqli.allow_persistent') }
          it { is_expected.to contain_php__setting('MySQLi/mysqli.cache_size') }
          it { is_expected.to contain_php__setting('MySQLi/mysqli.max_persistent') }
          it { is_expected.to contain_php__setting('Pdo_mysql/pdo_mysql.cache_size') }
          it { is_expected.to contain_php__setting('Pdo_mysql/pdo_mysql.default_socket') }
        end
      end
    end
  end
end
