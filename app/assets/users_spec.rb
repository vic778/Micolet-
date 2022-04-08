require 'rails_helper'

RSpec.describe 'Requests::UsersController', type: :request do
  describe 'POST /create' do
    before :each do
      get '/create'
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'responds with the correct text' do
      expect(response.body).to include('Hello from Home')
    end

    it ' has the right response status' do
      expect(response).to have_http_status(200)
    end
  end
end
