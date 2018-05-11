class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps do |t|
      t.string :name
      t.string :logo
      t.string :qr_code
      t.string :company
      t.string :size
      t.text :describe

      t.timestamps
    end
  end
end
