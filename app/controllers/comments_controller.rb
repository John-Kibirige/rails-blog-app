class CommentsController < ApplicationController

  def new
    @new_comment = Comment.new
  end
  def create
    post = Post.find(params[:post_id])
    all_comments = params[:comment]
    Comment.create(post: post, author: current_user, text: all_comments["comment"])

    redirect_to user_posts_path, notice: 'Successfully created post'
  end
end
