require 'spec_helper'

describe UsersController do
  let(:user) { create(:user) }

  describe 'GET show' do
    subject do
      get :show
      response
    end

    context 'when user is not signed in' do
      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context 'when user is signed in' do
      before do
        allow(controller).to receive(:authenticate_user!).and_return(user)
        allow(controller).to receive(:current_user).and_return(user)
      end

      it { is_expected.to render_template('show') }

      it 'returns 5 reviews' do
        create_list(:review, 8, user: user)
        get :show
        expect(controller.reviews.count).to eq 5
      end

      it 'returns only current user reviews' do
        user_review = create(:review, user: user)
        create(:review, user: create(:user))

        get :show

        expect(controller.reviews).to eq [user_review]
      end
    end
  end
end
