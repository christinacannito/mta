class ChangeDatatypeFromTimeToDatetime < ActiveRecord::Migration
  def up
    change_column :alerts, :end, :time
  end

  def down
  	change_column :alerts, :end, :datetime
  end

end
  
