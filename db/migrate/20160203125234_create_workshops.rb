class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :shortcut
      t.string :name
      t.integer :price
      t.text :description
      t.timestamps null: false
    end
  end
end
