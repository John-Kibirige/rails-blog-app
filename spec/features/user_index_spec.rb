require 'rails_helper'

RSpec.describe "User's", type: :feature do
  describe 'Index Page' do
    before(:each) do
      @user1 = User.create! name: 'Tom',
                            photo: 'https://source.unsplash.com/user/c_v_r/100x100',
                            bio: 'Tom bio'
      @user2 = User.create! name: 'Lilly',
                            photo: 'https://source.unsplash.com/user/c_v_r/100x100',
                            bio: 'Lilly bio'
      visit users_path
    end

    it 'should have username content of all other users' do
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it 'should have profile picture content of all other users' do
      expect(page).to have_xpath("//img[@src='#{@user1.photo}']")
    end

    it 'displays number of posts each user has written' do
      User.all.each do |user|
        expect(page).to have_content "Number of posts #{user.posts.size}"
      end
    end

    it 'should redirect to posts page when user is clicked' do
      click_link 'Tom'
      expect(page).to have_current_path(user_path(@user1))
    end
  end
end
