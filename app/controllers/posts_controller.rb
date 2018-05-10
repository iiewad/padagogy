class PostsController < ApplicationController
  helper PostsHelper

  def index
    @posts = Post.page params[:page]
    @hot_posts = Post.hot.take(5)
  end

  def show
    @post = Post.find(params['id'])
  end

end
