class RemoveLineIdFromAlerts < ActiveRecord::Migration
  def change
    remove_column :alerts, :line_id, :integer
  end
end
