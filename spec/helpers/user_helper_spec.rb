require 'spec_helper'

describe UserHelper do
  describe 'admin?' do
    subject { admin? user }
    context 'when user is nil' do
      let(:user) { nil }
      it { is_expected.to be_falsey }
    end

    context 'when user is not admin' do
      let(:user) { create(:user, admin: false) }
      it { is_expected.to be_falsey }
    end

    context 'when user is admin' do
      let(:user) { create(:user, admin: true) }
      it { is_expected.to be_truthy }
    end
  end
end
