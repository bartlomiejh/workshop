require 'spec_helper'

describe UserDecorator do
  describe '#member_since' do
    let(:user) { described_class.new(create(:user, created_at: Date.parse('01-01-2001'))) }
    subject { user.member_since }
    it { is_expected.to eq 'January 2001' }
  end
end