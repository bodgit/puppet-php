require 'spec_helper'

describe 'php::extension::pgsql' do

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
        it { is_expected.to contain_file('/etc/php.d/pgsql.ini') }
        it { is_expected.to contain_file('/etc/php.d/pdo_pgsql.ini') }
        it { is_expected.to contain_package('php-pgsql') }
        it { is_expected.to contain_php__extension('pgsql') }

        case facts[:os]['release']['major']
        when '6'
          it { is_expected.to contain_php_ini_setting('PostgresSQL/pgsql.allow_persistent') }
          it { is_expected.to contain_php_ini_setting('PostgresSQL/pgsql.auto_reset_persistent') }
          it { is_expected.to contain_php_ini_setting('PostgresSQL/pgsql.ignore_notice') }
          it { is_expected.to contain_php_ini_setting('PostgresSQL/pgsql.log_notice') }
          it { is_expected.to contain_php_ini_setting('PostgresSQL/pgsql.max_links') }
          it { is_expected.to contain_php_ini_setting('PostgresSQL/pgsql.max_persistent') }
          it { is_expected.to contain_php__setting('PostgresSQL/pgsql.allow_persistent') }
          it { is_expected.to contain_php__setting('PostgresSQL/pgsql.auto_reset_persistent') }
          it { is_expected.to contain_php__setting('PostgresSQL/pgsql.ignore_notice') }
          it { is_expected.to contain_php__setting('PostgresSQL/pgsql.log_notice') }
          it { is_expected.to contain_php__setting('PostgresSQL/pgsql.max_links') }
          it { is_expected.to contain_php__setting('PostgresSQL/pgsql.max_persistent') }
        else
          it { is_expected.to contain_php_ini_setting('PostgreSQL/pgsql.allow_persistent') }
          it { is_expected.to contain_php_ini_setting('PostgreSQL/pgsql.auto_reset_persistent') }
          it { is_expected.to contain_php_ini_setting('PostgreSQL/pgsql.ignore_notice') }
          it { is_expected.to contain_php_ini_setting('PostgreSQL/pgsql.log_notice') }
          it { is_expected.to contain_php_ini_setting('PostgreSQL/pgsql.max_links') }
          it { is_expected.to contain_php_ini_setting('PostgreSQL/pgsql.max_persistent') }
          it { is_expected.to contain_php__setting('PostgreSQL/pgsql.allow_persistent') }
          it { is_expected.to contain_php__setting('PostgreSQL/pgsql.auto_reset_persistent') }
          it { is_expected.to contain_php__setting('PostgreSQL/pgsql.ignore_notice') }
          it { is_expected.to contain_php__setting('PostgreSQL/pgsql.log_notice') }
          it { is_expected.to contain_php__setting('PostgreSQL/pgsql.max_links') }
          it { is_expected.to contain_php__setting('PostgreSQL/pgsql.max_persistent') }
        end
      end
    end
  end
end
