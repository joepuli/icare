require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user: user) }

  context 'valid user' do
    before do
      sign_in user
    end

    describe '#new' do
      it 'renders new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe '#create' do
      it 'redirects to show action' do
        post :create, profile: attributes_for(:profile, user: user)
        expect(response).to redirect_to(assigns(:profile))
      end
    end

    describe '#edit' do
      it 'renders edit template' do
        get :edit, id: profile.id
        expect(response).to render_template(:edit)
      end
    end

    describe '#update' do
      it 'redirects to show action' do
        patch :update, id: profile.id, profile: profile.attributes
        expect(response).to redirect_to(assigns(:profile))
      end
    end
  end

  context 'guest' do
    describe '#new' do
      it 'redirect to sign in' do
        get 'new'
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe '#create' do
      it 'redirect to sign in' do
        post :create, profile: attributes_for(:profile, user: user)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe '#edit' do
      it 'redirect to sign in' do
        get :edit, id: 1
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe '#update' do
      it 'redirect to sign in' do
        patch :update, id: profile.id, profile: profile.attributes
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
