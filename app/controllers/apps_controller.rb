class AppsController < ApplicationController
  def index
    @apps = App.all
  end

  def show
    @app = App.find(params[:id])
    if current_user
      @new_comment = Comment.build_from(@app, current_user.id, "")
    else
      @new_comment = Comment.new
    end
  end
end
