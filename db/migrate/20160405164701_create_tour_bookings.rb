class CreateTourBookings < ActiveRecord::Migration
  def change
    create_table :tour_bookings do |t|
      t.decimal :cost
      t.string :tourname
      t.string :bookingname
      t.string :date
      t.string :time
      t.string :description

      t.timestamps null: false
    end
  end
end
