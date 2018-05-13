class AppsController < ApplicationController
  def index

  end

  def show
    @app = App.find(params[:id])
    if current_user
      @new_comment = Comment.build_from(@app, current_user.id, "")
    else
      @new_comment = Comment.new
    end
  end

  def category
    @padagogy_category = PadagogyCategory.all
    @subject_category = SubjectCategory.all
    @grade_category = GradeCategory.all
    render :json => {
      status: 'success',
      message: '请求成功',
      data: {
        padagogy: @padagogy_category,
        subject: @subject_category,
        grade: @grade_category
      }
    }
  end

  def apps_category
    apps = App.select(:id, :name, :logo, :size)
    if params['padagogy'].present?
      apps = apps.where(padagogy_category_id: params['padagogy'])
    end
    if params['subject'].present?
      apps = apps.where(subject_category_id: params['subject'])
    end
    if params['grade'].present?
      apps = apps.where(grade_category_id: params['grade'])
    end

    render :json => {
      status: 'success',
      message: '请求成功',
      data: apps
    }

  end

end
