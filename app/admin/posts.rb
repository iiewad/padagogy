ActiveAdmin.register Post do
  menu label: "文章"
  permit_params :user, :title, :summary, :cover, :status, :body

  scope :normal
  scope :hot

  index do
    selectable_column
    id_column
    column :title
    column :summary
    column :cover do |post|
      image_tag(post.cover.url(:thumb))
    end
    column :status do |post|
        status_tag(post.status)
    end
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :user, :as => :select
      f.input :title
      f.input :status, :as => :radio
      f.input :cover, :as => :file, :hint => f.image_tag(f.object.cover.url)
      f.input :body, :as => :ckeditor
    end
    f.actions
  end

end
