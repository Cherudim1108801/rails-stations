class CreateSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :sheets do |t|
      t.integer "column", limit: 5, null: false, comment: "座席列番号"
      t.string "row", limit: 1, null: false, comment: "座席行アルファベット"

      t.timestamps
    end
  end
end
