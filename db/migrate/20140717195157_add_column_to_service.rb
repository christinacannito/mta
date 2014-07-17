class AddColumnToService < ActiveRecord::Migration
  def change
    add_column :services, :line_id, :reference
  end
end
