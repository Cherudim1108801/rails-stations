class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :movies, foreign_key:true
      t.datetime "start_time", comment:"上映開始時刻"
      t.datetime "end_time", comment:"上映終了時刻"


      t.timestamps
    end
  end
end
