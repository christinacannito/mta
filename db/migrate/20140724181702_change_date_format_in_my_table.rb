class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
       change_column :alerts, :start, :time

  end
end
