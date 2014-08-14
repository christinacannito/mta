class ChangeStartAndEndInAlertsToDateTimeTypes < ActiveRecord::Migration
  def change
  	change_column :alerts, :last_sent, :datetime
  	change_column :alerts, :end, :datetime
  	change_column :alerts, :start, :datetime
  end
end
