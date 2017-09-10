class Reservation < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :golfclub
	belongs_to :timeslot, optional: true
	validate :check_empty, :check_availablity, :check_multiple

	private
		def check_empty
			if timeslot_id == 'Select One'
				errors.add(:empty, message: 'empty')
				end
		end
		def check_availablity
			if reservation.date in Reservation.where({date: reservation.date})
				if reservation.timeslot in Reservation.where({})
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
		end




end
