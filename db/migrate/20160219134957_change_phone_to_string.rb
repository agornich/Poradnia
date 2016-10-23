class ChangePhoneToString < ActiveRecord::Migration
def up
  change_column :patients, :phone, :string
  end

  def down
    change_column :patients, :phone, :integer
  end
end