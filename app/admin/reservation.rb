ActiveAdmin.register Reservation do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :user_id, :golfclub_id, :timeslot_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
  f.inputs 'TEST' do
    f.input :user_id, :label => 'User', :as => :select, :collection => User.all.pluck("name, id")

    f.input :golfclub_id, :label => 'Golfclub', :as => :select, :collection => Golfclub.all.pluck("name, id")

    f.input :timeslot_id, :label => 'Timeslot', :as => :select, :collection => Timeslot.all.sort.map{|u| ["#{u.golfclub.name}, #{u.title}", u.id]}

  end
  f.actions
end

csv do
  column :user_id
  column(:user) { |p| p.user.name }
  column(:timeslot) {|p| p.timeslot.title} # preserve case
  column(:golfclub) {|p| p.golfclub.name}
end

ActiveAdmin.register Reservation do

  controller do
    # This code is evaluated within the controller class

    def new
      @reservation = Reservation.new
      timeslots = Timeslot.first.title
    end
    def create
      @reservation = Reservation.new(reservation_params)
      @reservation.user = current_user
      if @reservation.save
        @timeslot = Timeslot.find(@reservation.timeslot_id)
        @timeslot.available = false
        @timeslot.user = current_user
        @timeslot.save
        render 'index'
      else
        if @reservation.errors.include?(:golfclub)
          flash[:error] = "Please make sure your golfclub corresponds to timeslot"
          render action: 'new'
        end
        if @reservation.errors.include?(:overlap)
          flash[:error] = "This timeslot is reserved! Delete reservation and try again"
          render action: 'new'
        end
      end
    end

		def destroy
			@reservation = Reservation.find(params[:id])
			@timeslot = Timeslot.find(@reservation.timeslot_id)
			@timeslot.available = true
			@timeslot.user = nil
			@timeslot.save
			@reservation.destroy
      render 'index'

		end

    def reservation_params
        params.require(:reservation).permit(:id, :golfclub_id, :timeslot_id, :user_id)
    end
  end

end

end
