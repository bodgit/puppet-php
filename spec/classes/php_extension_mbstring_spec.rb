require 'spec_helper'

describe 'php::extension::mbstring' do

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
        it { is_expected.to contain_file('/etc/php.d/mbstring.ini') }
        it { is_expected.to contain_package('php-mbstring') }
        it { is_expected.to contain_php__extension('mbstring') }
      end
    end
  end
end
