class AddLastAlertStatusToAlerts < ActiveRecord::Migration
  def change
    add_column :alerts, :last_alert_status, :string
  end
end
