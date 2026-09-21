class CreateSeats < ActiveRecord::Migration[7.1]
  def change
    create_table :seats do |t|
      t.integer "column", limit: 5, null: false, comment: "座席列番号"
      t.string "row", limit: 1, null: false, comment: "座席行アルファベット"
    end
  end
end
