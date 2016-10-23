class AddColumnsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :email, :string
	add_column :employees, :crypted_password, :string
    add_column :employees, :salt, :string
  end

end
