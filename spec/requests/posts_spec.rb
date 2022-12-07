require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  it 'renders all posts for a particular user on the page ' do
    get '/users/1/posts'
    expect(response.body).to include('The following is a list of posts')
  end

  it 'renders all the specifics of a single post based on the id ' do
    get '/users/1/posts/3'
    expect(response.body).to include('This is a post whose id is 3')
  end
end
