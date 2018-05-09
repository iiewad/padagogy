class PostsController < ApplicationController
  helper PostsHelper

  def index
    @posts = Post.page params[:page]
  end

  def show
    @post = Post.find(params['id'])
  end

end
