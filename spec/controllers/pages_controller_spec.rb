require 'rails_helper'

describe PagesController, type: :controller do
  
  describe 'about' do
    it 'takes you to the about page' do
      get :about
      expect(response.status).to eq 200
      expect(response).to render_template :about
    end
  end

  describe 'third parties' do
    it 'takes you to the third parties page' do
      get :third_parties
      expect(response.status).to eq 200
      expect(response).to render_template :third_parties
    end
  end
end
