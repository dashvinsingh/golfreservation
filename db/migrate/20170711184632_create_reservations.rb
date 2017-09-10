class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|

    	t.integer :user_id
    	t.integer :golfclub_id
    	t.integer :timeslot_id
    	t.date  :date

      t.timestamps
    end
  end
end
