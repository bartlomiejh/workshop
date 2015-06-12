class AddAdminFlagToUser < ActiveRecord::Migration
  def change
    add_column User, :admin, :boolean, default: false, null: false
  end
end
