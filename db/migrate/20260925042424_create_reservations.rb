class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date "date", comment:"予約日"
      t.references :schedule, foreign_key: {to_table: :schedules}
      t.references :seat, foreign_key: {to_table: :seats}
      t.string "email", comment:"予約者メールアドレス", limit: 255
      t.string "name", comment:"予約者名", limit: 50
      t.timestamps

      t.index [:date, :schedule_id, :seat_id], unique: true, name: "reservation_schedule_seat_unique"
    end
  end
end
