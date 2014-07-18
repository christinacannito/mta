class ChangeLineIdIdToLineId < ActiveRecord::Migration
  def change
    rename_column :alerts, :line_id_id, :line_id
    rename_column :alerts, :recipient_id_id, :recipient_id
    rename_column :alerts, :user_id_id, :user_id
  end
end
