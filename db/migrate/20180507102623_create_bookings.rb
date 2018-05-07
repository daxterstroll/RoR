class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :cars_id
      t.date :start_dates
      t.date :end_dates

      t.timestamps null: false
    end
  end
end
