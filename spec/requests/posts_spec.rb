require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET #index' do
    user = User.create(name: 'user1', posts_counter: 0)
    user.save

    before :each do
      get "/users/1/posts"
    end
    it 'index returns a success response' do
      expect(response).to be_successful
    end

    it 'index returns a 201 response' do
      expect(response).not_to have_http_status(:created)
    end

    it 'index returns actual template' do
      expect(response.body).to include('<section>')
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  context 'GET #show' do

    before(:each) { get "/users/1/posts/1" }

    it 'show returns a success response' do
      expect(response).to be_successful
    end

    it 'show returns a 201 response' do
      expect(response).not_to have_http_status(:created)
    end

    it 'show returns actual template' do
      expect(response.body).to_not include('<h5>')
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end