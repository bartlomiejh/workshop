class AddNamesToUser < ActiveRecord::Migration
  def change
    add_column User, :firstname, :string
    add_column User, :lastname, :string
  end
end
