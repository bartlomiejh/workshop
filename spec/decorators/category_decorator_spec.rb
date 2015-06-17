require 'spec_helper'

describe CategoryDecorator do
  describe '#can_edit_any_product?' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:category) { described_class.new(create(:category)) }

    subject { category.can_edit_any_product? user1 }
    context 'when products empty' do
      it { is_expected.to be_falsey }
    end

    context 'when there is not owned product' do
      let!(:product1) { create(:product, category: category, user: user2) }
      let!(:product2) { create(:product, category: category, user: user2) }
      it { is_expected.to be_falsey }
    end

    context 'when there is owned product' do
      let!(:product1) { create(:product, category: category, user: user1) }
      let!(:product2) { create(:product, category: category, user: user2) }
      it { is_expected.to be_truthy }
    end
  end
end
