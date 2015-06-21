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
      before { controller.stub(:authenticate_user!).and_return(user) }
      it { is_expected.to render_template('show') }
    end
  end
end
