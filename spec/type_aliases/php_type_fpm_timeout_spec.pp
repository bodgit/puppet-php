require 'spec_helper'

describe 'PHP::Type::FPM::Timeout' do
  it { is_expected.to allow_values(0, '0s', '0m', '0h', '0d') }
  it { is_expected.not_to allow_value('invalid', -1) }
end
