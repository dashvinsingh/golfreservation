class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :golfclub
	belongs_to :timeslot
	validate :check_empty, :check_availablity, :check_multiple, :check_golfclub_id

	private
		def check_empty
			if timeslot_id == 'Select One'
				errors.add(:empty, message: 'empty')
				end
		end
		def check_availablity
			if timeslot && timeslot.available != true
				errors.add(:timeslot, message: 'error')
				end
		end

		def check_multiple
			userobj = user
			res = Reservation.where({user_id: userobj.id})
			for item in res
				time = Timeslot.find(item.timeslot_id)
				if time.title == timeslot.title
					errors.add(:overlap, message: 'overlap')
				end
			end

			def check_golfclub_id
				time = Timeslot.where({id: timeslot_id}).first
				if golfclub_id != time.golfclub_id
					errors.add(:golfclub, message: "incorrect")
				end
			end
		end




end
