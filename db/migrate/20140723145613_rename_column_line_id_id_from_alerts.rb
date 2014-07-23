class RenameColumnLineIdIdFromAlerts < ActiveRecord::Migration
	def change
		change_table :alerts do |t|
			t.rename :user_id_id, :user_id
			t.rename :recipient_id_id, :recipient_id
		end
	end
end
