require 'rails_helper'

RSpec.describe Ujs::TrainingsController, type: :controller do
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user: user) }
  let(:training) { create(:training, profile: profile) }

  context 'valid user' do
    before do
      sign_in user
    end

    describe '#edit' do
      it 'returns status 200' do
        xhr :get, :edit, id: training.id, profile_id: profile.id
        expect(response).to have_http_status(:ok)
      end
    end

    describe '#update' do
      it 'returns status :ok' do
        training.name = 'hello'
        xhr :patch, :update, id: training.id, profile_id: profile.id,
                             training: training.attributes
        expect(response).to have_http_status(:ok)
      end
    end

    describe '#destroy' do
      it 'returns status :ok' do
        xhr :delete, :destroy, id: training.id, profile_id: profile.id
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context 'guest' do
    describe '#edit' do
      it 'returns status :unauthorized' do
        xhr :get, :edit, id: training.id, profile_id: profile.id
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe '#update' do
      it 'returns status :unauthorized' do
        training.name = 'hello'
        xhr :patch, :update, id: training.id, profile_id: profile.id,
                             training: training.attributes
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe '#destroy' do
      it 'returns status :unauthorized' do
        xhr :delete, :destroy, id: training.id, profile_id: profile.id
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
