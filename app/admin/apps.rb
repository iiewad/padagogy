ActiveAdmin.register App do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name,
                :logo,
                :qr_code,
                :company,
                :size,
                :describe,
                :padagogy_category_id,
                :subject_category_id,
                :grade_category_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
