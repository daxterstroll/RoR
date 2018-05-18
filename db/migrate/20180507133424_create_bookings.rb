class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :started_at
      t.date :ended_on

      t.timestamps null: false
    end
  end
end
