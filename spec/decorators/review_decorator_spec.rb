require 'spec_helper'

describe ReviewDecorator do
  let(:user) { build(:user, firstname: 'John', lastname: 'Doe') }
  let(:review) { described_class.new(build(:review, user: user, created_at: Date.parse('01-01-2001'))) }

  describe '#author' do
    it 'displays review author fullname' do
      expect(review.author).to eq 'John Doe'
    end
  end

  describe '#creation_date' do
    subject { review.creation_date }
    it { is_expected.to eq '01-01-2001' }
  end
end
