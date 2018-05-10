class PostsController < ApplicationController
  helper PostsHelper
  # before_action :authenticate_user!

  def index
    @posts = Post.page params[:page]
    @hot_posts = Post.hot.take(5)
  end

  def show
    @post = Post.find(params['id'])
    if current_user
      @new_comment = Comment.build_from(@post, current_user.id, "")
    else
      @new_comment = Comment.new
    end
  end

end
