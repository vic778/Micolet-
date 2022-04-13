require 'rails_helper'

RSpec.describe 'Requests::UsersController', type: :request do
  describe 'POST /create' do
    before :each do
      it 'should create a new user' do
        post users_path,
             params: { user: { email: 'victoir@gmail.com', preferences: [{ name: 'test', value: 'test' }] } }
      end

      it 'responds with the correct text' do
        expect(response.body).to include('Hello from index')
      end

      it ' has the right response status' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
