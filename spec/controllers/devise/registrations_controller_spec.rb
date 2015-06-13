require 'spec_helper'

describe Devise::RegistrationsController do
  describe 'POST create' do
    before { @request.env['devise.mapping'] = Devise.mappings[:user] }

    let(:invalid_params) do
      { email: 'user@sam.ple',
        password: 'Qwerty123',
        password_confirmation: 'Qwerty123' }
    end
    let(:valid_params) do
      invalid_params.merge(firstname: 'firstname', lastname: 'lastname')
    end

    context 'with invalid params' do
      subject { -> { post :create, user: invalid_params } }
      it { is_expected.not_to change(User, :count) }
    end

    context 'with valid params' do
      subject { -> { post :create, user: valid_params } }
      it { is_expected.to change(User, :count).by(1) }
    end
  end
end
