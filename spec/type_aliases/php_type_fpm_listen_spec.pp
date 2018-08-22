require 'spec_helper'

describe 'PHP::Type::FPM::Listen' do
  it { is_expected.to allow_values(['192.0.2.1', 9000], 9000, '/var/run/php-fpm/www.sock') }
  it { is_expected.not_to allow_value('invalid', -1, ['2001:db8::1', 9000]) }
end
