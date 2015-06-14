require 'spec_helper'

describe ReviewsController do
  describe 'POST create' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:product) { create(:product) }
    let(:valid_params) { { content: 'content', rating: '1' } }

    context 'when user is signed in' do
      before { controller.stub(:current_user).and_return(user) }

      subject { -> { post :create, review: valid_params, category_id: category.to_param, product_id: product.to_param } }
      it { is_expected.to change(Review, :count).by(1) }
    end

    context 'when user is not signed in' do
      before { controller.stub(:current_user).and_return(nil) }

      subject do
        post :create, review: valid_params, category_id: category.to_param, product_id: product.to_param
        response
      end
      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end
end
