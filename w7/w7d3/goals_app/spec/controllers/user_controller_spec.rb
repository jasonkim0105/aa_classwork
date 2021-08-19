require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do
    it 'renders new user template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:user_params) do {
        user: {
          username: 'maisie',
          password: 'password'
        }
      }
      end
      it 'logs in user' do
        post :create, params: user_params
        user = User.find_by(username: 'maisie')
        expect(session[:session_token]).to eq(user.session_token)
      end

      it 'redirects to user show page' do
        post :create, params: user_params
        user = User.find_by(username: 'maisie')
        expect(response).to redirect_to(user_url(user))
      end
    end
    context 'with invalid params' do
      it 'validates the presence of username, password, and renders the new template with errors' do
        post :create, params: {user: {username: 'blob', password: 'password'}}
        expect(response).to render_template(:new)
        # expect(flash[:errors]).to be_present
      end
    end
  end

end
