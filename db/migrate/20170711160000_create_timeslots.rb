class CreateTimeslots < ActiveRecord::Migration[5.1]
  def change
    create_table :timeslots do |t|
    	
    	t.string :title
    	t.integer :golfclub_id
    	t.boolean :available, :default => true
    	t.integer :user_id, :null => true

      t.timestamps
    end

  end
end
