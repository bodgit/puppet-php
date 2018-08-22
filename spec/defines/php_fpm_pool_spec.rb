require 'spec_helper'

describe 'php::fpm::pool' do

  let(:title) do
    'test'
  end

  let(:params) do
    {
      listen:          '/var/run/php-fpm/test.sock',
      pm:              'static',
      pm_max_children: 5,
      user:            'apache',
    }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'without php::fpm class included' do
        it { is_expected.to compile.and_raise_error(/must include the php::fpm base class/) }
      end

      context 'with php class included' do
        let(:pre_condition) do
          'include ::php include ::php::fpm'
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file('/etc/php-fpm.d/test.conf') }
      end
    end
  end
end
