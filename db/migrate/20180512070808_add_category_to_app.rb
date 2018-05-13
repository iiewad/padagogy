class AddCategoryToApp < ActiveRecord::Migration[5.1]
  def change
    add_column :apps, :padagogy_category_id, :integer
    add_column :apps, :subject_category_id, :integer
    add_column :apps, :grade_category_id, :integer
  end
end
