require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /index' do
    before :each do
      get root_path
    end

    it 'it should render all posts' do
      expect(response).to render_template(:index)
    end

    it 'responds with the correct text' do
      expect(response.body).to include('Micolet')
    end

    it 'responds with a 200 status code' do
      expect(response).to have_http_status(200)
    end
  end
end
