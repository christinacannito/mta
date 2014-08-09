class ChangeAlertColumnTypeToDate < ActiveRecord::Migration
  def change
  	change_column :alerts, :last_sent, :time
  end
end
