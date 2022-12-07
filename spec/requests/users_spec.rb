require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'renders all users on the page ' do
    get '/users'
    expect(response.body).to include('This is a list of all users')
  end

  it 'renders all the specifics of a single user based on the id ' do
    get '/users/1'
    expect(response.body).to include('These are the details of only one user whose id is 1')
  end
end
