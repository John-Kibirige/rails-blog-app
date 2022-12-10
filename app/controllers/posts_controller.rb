class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    puts params[:id]
    @post = Post.find(params[:id])
  end

  def new
    @new_post = Post.new
  end

  def create
    all_posts = params[:post]

    Post.create(author: current_user, title: all_posts["title"], text: all_posts["text"])

    redirect_to user_posts_path, notice: "Successfully created post"
  end


end
