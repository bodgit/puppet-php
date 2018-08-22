require 'spec_helper'

describe 'php::extension::ldap' do

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
        it { is_expected.to contain_file('/etc/php.d/ldap.ini') }
        it { is_expected.to contain_package('php-ldap') }
        it { is_expected.to contain_php__extension('ldap') }

        case facts[:os]['release']['major']
        when '6'
          # noop
        else
          it { is_expected.to contain_php_ini_setting('ldap/ldap.max_links') }
          it { is_expected.to contain_php__setting('ldap/ldap.max_links') }
        end
      end
    end
  end
end
