class ChangePeselToString < ActiveRecord::Migration
  def up
    change_column :patients, :pesel, :string
  end

  def down
    change_column :patients, :pesel, :integer
  end
end