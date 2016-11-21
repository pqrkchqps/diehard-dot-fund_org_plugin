require 'rails_helper'

describe PagesController, type: :controller do
  let(:usuario) { create(:user, selected_locale: :es) }

  describe 'marketing' do
    it 'takes you to the marketing page when logged out' do
      get :marketing
      expect(response.status).to eq 200
      expect(response).to render_template :marketing
    end

    it 'takes you to the marketing page when logged in' do
      sign_in create(:user)
      get :marketing
      expect(response.status).to eq 200
      expect(response).to render_template :marketing
    end
  end

  describe 'about' do
    it 'takes you to the about page' do
      get :about
      expect(response.status).to eq 200
      expect(response).to render_template :about
    end

    it 'sets the help links correctly' do
      sign_in usuario
      get :about
      expect(assigns(:help_link)).to eq 'https://loomio.gitbooks.io/manual/content/es/index.html'
    end
  end
end
