require 'spec_helper'

describe 'php::extension::mssql' do

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
        it { is_expected.to contain_file('/etc/php.d/mssql.ini') }
        it { is_expected.to contain_file('/etc/php.d/pdo_dblib.ini') }
        it { is_expected.to contain_package('php-mssql') }
        it { is_expected.to contain_php_ini_setting('MSSQL/mssql.allow_persistent') }
        it { is_expected.to contain_php_ini_setting('MSSQL/mssql.compatability_mode') }
        it { is_expected.to contain_php_ini_setting('MSSQL/mssql.max_links') }
        it { is_expected.to contain_php_ini_setting('MSSQL/mssql.max_persistent') }
        it { is_expected.to contain_php_ini_setting('MSSQL/mssql.min_error_severity') }
        it { is_expected.to contain_php_ini_setting('MSSQL/mssql.min_message_severity') }
        it { is_expected.to contain_php_ini_setting('MSSQL/mssql.secure_connection') }
        it { is_expected.to contain_php__extension('mssql') }
        it { is_expected.to contain_php__setting('MSSQL/mssql.allow_persistent') }
        it { is_expected.to contain_php__setting('MSSQL/mssql.compatability_mode') }
        it { is_expected.to contain_php__setting('MSSQL/mssql.max_links') }
        it { is_expected.to contain_php__setting('MSSQL/mssql.max_persistent') }
        it { is_expected.to contain_php__setting('MSSQL/mssql.min_error_severity') }
        it { is_expected.to contain_php__setting('MSSQL/mssql.min_message_severity') }
        it { is_expected.to contain_php__setting('MSSQL/mssql.secure_connection') }
      end
    end
  end
end
