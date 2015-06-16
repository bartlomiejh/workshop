require 'spec_helper'

describe Product do
  describe '.can_edit?' do
    let(:user) { create(:user) }
    subject { product.can_edit? user }

    context 'when is owner' do
      let(:product) { create(:product, user: user) }
      it { is_expected.to be_truthy }
    end

    context 'when is not owner' do
      let(:product) { create(:product) }
      it { is_expected.to be_falsey }
    end
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }

    describe '#price' do
      let(:product) { build(:product, price: 1.234) }

      it 'is limited to two decimal places' do
        expect(product).to_not be_valid
      end
    end

    describe '#average_rating' do
      let(:user) { create(:user) }
      let(:product) { create(:product) }
      let(:review1) { create(:review, rating: 2, user: user) }
      let(:review2) { create(:review, rating: 3, user: user) }

      before do
        product.reviews << [review1, review2]
      end

      it 'calculates average rating' do
        expect(product.average_rating).to eq 2.5
      end
    end
  end
end
