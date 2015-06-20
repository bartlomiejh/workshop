require 'spec_helper'

describe ReviewsController do
  describe 'POST create' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:product) { create(:product) }
    let(:valid_params) do
      { review: { content: 'content', rating: '1' },
        category_id: category.to_param,
        product_id: product.to_param }
    end

    context 'when user is signed in' do
      before do
        controller.stub(:current_user).and_return(user)
        controller.stub(:authenticate_user!).and_return(user)
      end

      context 'and params are valid' do
        subject { -> { post :create, valid_params } }
        it { is_expected.to change(Review, :count).by(1) }
      end

      context 'and params are invalid' do
        before { allow_any_instance_of(Review).to receive(:save).and_return(false) }

        subject do
          post :create, valid_params
          response
        end

        it { is_expected.to render_template('new') }
      end
    end
  end

  context 'when user is not signed in' do
    before { controller.stub(:current_user).and_return(nil) }

    subject do
      post :create, valid_params
      response
    end
    it { is_expected.to redirect_to(new_user_session_path) }
  end
end
