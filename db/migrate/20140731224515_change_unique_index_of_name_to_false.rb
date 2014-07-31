class ChangeUniqueIndexOfNameToFalse < ActiveRecord::Migration
  def change
  	remove_index :users, [:name]
  	add_index :users, [:name], unique: false
  end
end
