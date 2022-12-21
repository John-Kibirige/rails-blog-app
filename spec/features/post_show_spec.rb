require 'rails_helper'
​
RSpec.describe 'Post Show', type: :feature do
  before :each do
    @avatar_pic = 'https://whatsondisneyplus.com/wp-content/uploads/2022/09/andor-avatar.png'
    @author = User.create(name: 'Cassian Andor',
                          photo: @avatar_pic,
                          bio: 'thubg')
    @post = Post.create(author: @author, title: 'tit',
                        text: 'This it')
​
    @com1 = Comment.create(author: @author, post: @post, text: 'Thank you for your support')
    @com2 = Comment.create(author: @author, post: @post, text: 'Hello there Cassian, this Dero I am watching you')
    @com3 = Comment.create(author: @author, post: @post, text: 'Spend the credits wisely :|')
​
    @like1 = @post.likes.create!(author: @author)
​
    visit user_post_path(@author, @post)
  end
​
  it 'shows the username of the user' do
    expect(page).to have_content(@author.name)
  end
​
  it 'shows number of comments the post has' do
    expect(page.body).to include('Comments: 3')
  end
​
  it 'shows number of likes a post has' do
    expect(page.body).to include('Likes: 1')
  end
​
  it 'shows the title of the post' do
    expect(page).to have_content(@post.title)
  end
​
  it 'shows part of a post body (This is ObiWans\' message: Don\'t let the Empire win)' do
    expect(page).to have_content(@post.text)
  end
​
  it 'shows the comments on the post users left lik(Thank you for your support 😊)' do
    expect(page).to have_content(@com1.text)
    expect(page).to have_content(@com2.text)
    expect(page).to have_content(@com3.text)
  end
​
  it 'shows the user name of a comment' do
    expect(page).to have_content(@com1.author.name)
    expect(page).to have_content(@com2.author.name)
    expect(page).to have_content(@com3.author.name)
  end
​
  it 'not to show the Pagination buttons' do
    expect(page).not_to have_content('Prev 1 Next')
  end
end