class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :workspace, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end

#comment
