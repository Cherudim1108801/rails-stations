class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :movie, foreign_key: { to_table: :movies}
      t.time "start_time", comment:"上映開始時刻"
      t.time "end_time", comment:"上映終了時刻"


      t.timestamps
    end
  end
end
