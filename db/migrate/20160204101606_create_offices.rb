class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :shortcut
      t.string :name
      t.integer :floor
      t.text :description
      t.timestamps null: false
    end
  end
end
