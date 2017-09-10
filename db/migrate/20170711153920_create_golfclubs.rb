class CreateGolfclubs < ActiveRecord::Migration[5.1]
  def change
    create_table :golfclubs do |t|

		t.string :name

      t.timestamps
    end
  end
end
