class Service < ActiveRecord::Base
	belongs_to :alert
	# I want to pass the user's choosen line, and  match the record where the  Line.id for that choosen line = Service.line_id
	scope :track_it, lambda{|trainline| where(["name LIKE ?", "%#{user_trainline}%"])}
end
