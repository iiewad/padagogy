ActiveAdmin.register Post do
permit_params :user, :title, :summary, :body

form do |f|
  f.inputs do
    f.input :user, :as => :select
    f.input :title
    f.input :summary
    f.input :body, :as => :ckeditor
  end
  f.actions
end

end
