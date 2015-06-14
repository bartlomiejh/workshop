require 'spec_helper'

describe ReviewsController do
  describe 'POST create' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:product) { create(:product) }
    let(:valid_params) { { content: 'content', rating: '1' } }

    before { controller.stub(:current_user).and_return(user) }

    context 'with valid params' do
      subject { -> { post :create, review: valid_params, category_id: category.to_param, product_id: product.to_param } }
      it { is_expected.to change(Review, :count).by(1) }
    end
  end
end
