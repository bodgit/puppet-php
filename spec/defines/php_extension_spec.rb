require 'spec_helper'

describe 'php::extension' do

  let(:title) do
    'test'
  end

  let(:params) do
    {
      package_name: 'php-test',
      extensions:   [
        'test',
      ],
      settings:     {
       'test/test.setting' => 'test',
      },
    }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'without php::fpm class included' do
        it { is_expected.to compile.and_raise_error(/must include the php base class/) }
      end

      context 'with php class included' do
        let(:pre_condition) do
          'include ::php'
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file('/etc/php.d/test.ini') }
        it { is_expected.to contain_package('php-test') }
        it { is_expected.to contain_php_ini_setting('test/test.setting') }
        it { is_expected.to contain_php__setting('test/test.setting') }
      end
    end
  end
end
