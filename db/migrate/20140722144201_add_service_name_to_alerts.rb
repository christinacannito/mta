class AddServiceNameToAlerts < ActiveRecord::Migration
  def change
    add_column :alerts, :service_name, :string
  end
end
