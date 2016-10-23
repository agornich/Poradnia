class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :patient_id, null: false
      t.integer :workshop_id, null: false
      t.integer :office_id, null: false
      t.integer :employee_id, null: false
      t.datetime :start_at
      t.text :description
      t.timestamps null: false
    end
  end
end

