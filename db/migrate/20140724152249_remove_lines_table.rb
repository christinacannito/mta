class RemoveLinesTable < ActiveRecord::Migration
  def change
  	drop_table :lines
  end
end
