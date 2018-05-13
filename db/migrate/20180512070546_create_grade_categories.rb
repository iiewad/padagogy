class CreateGradeCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :grade_categories do |t|
      t.string :name
      t.string :describe

      t.timestamps
    end
  end
end
