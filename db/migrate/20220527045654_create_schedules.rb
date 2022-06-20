class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    
    create_table :schedules do |t|
     t.datetime "start_time", comment:"上映開始時刻"
     t.datetime "end_time", comment:"上映終了時刻"
     t.index "movie_id_idx", :movie_id

      t.timestamps
    end

    remove_index :schedules, column: :movie_id_idx
    
    change_table :schedules do |t|
      t.index "movie_id_idx", :movie_id
    end
  end
end
