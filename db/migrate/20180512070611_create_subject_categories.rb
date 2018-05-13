class CreateSubjectCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :subject_categories do |t|
      t.string :name
      t.string :describe

      t.timestamps
    end
  end
end
