class Timeslot < ApplicationRecord
	belongs_to :golfclub
	belongs_to :user, optional: true

    def status
	  self.available ? "Yes" : "No"
	end
end
