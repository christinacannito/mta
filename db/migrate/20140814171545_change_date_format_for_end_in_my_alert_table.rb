class ChangeDateFormatForEndInMyAlertTable < ActiveRecord::Migration
  def change
  	change_column :alerts, :start, :datetime

  end
end
