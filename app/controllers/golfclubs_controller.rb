class GolfclubsController < ApplicationController
	before_action :authenticate_user!
  def index
  	@clubs = Golfclub.all
  end

  def new
    @reservation = Reservation.new
  end

  def show
    @reservation = Reservation.new
  	@golfclub = Golfclub.find(params[:id])
  	@times = @golfclub.timeslots.all
    # @timeslots = Timeslot.where("golfclub_id = ?", @golfclub.id)
    @timeslots = Timeslot.where({ golfclub_id: @golfclub.id,  available: true })

    @golfclubs = Golfclub.all

  end

end
