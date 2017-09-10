class ReservationsController < ApplicationController
	before_action :authenticate_user!
	def index
		@reservations = Reservation.all
		@timeslots = Timeslot.all
	end

	def new
		@reservation = Reservation.new
		@golfclub = Golfclub.find(params[:id])
	    @timeslots = Timeslot.where("golfclub_id = ?", @golfclub.id)
	end

	def show
	    @reservation = Reservation.find(params[:id])
  	end


	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.user = current_user
		if @reservation.save
			@timeslot = Timeslot.find(@reservation.timeslot_id)
			@timeslot.available = false
			@timeslot.user = current_user
			@timeslot.save
			render 'show'

		else
			if @reservation.errors.include?(:timeslot)
				redirect_to golfclub_path(@golfclub, id: @reservation.golfclub_id, :error=>true)
			end
			if @reservation.errors.include?(:overlap)
				redirect_to golfclub_path(@golfclub, id: @reservation.golfclub_id, :error=>'overlap')
			end
			if @reservation.errors.include?(:empty)
				redirect_to golfclub_path(@golfclub, id: @reservation.golfclub_id, :error=>'empty')
			end

			# render "golfclubs/show/#{@reservation.golfclub_id}"
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@timeslot = Timeslot.find(@reservation.timeslot_id)
		@timeslot.available = true
		@timeslot.user = nil
		@timeslot.save
		@reservation.destroy
		redirect_to root_path(:delete=>'true')
	end

	private
		def reservation_params
	      params.require(:reservation).permit(:id, :golfclub_id, :timeslot_id, :user_id)
	  	end


end
