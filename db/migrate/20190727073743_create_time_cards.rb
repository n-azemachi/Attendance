class CreateTimeCards < ActiveRecord::Migration[5.0]
  def change
    create_table :time_cards do |t|
      t.string :division
      t.date :day
      t.time :starttime
      t.time :endtime

      t.timestamps
    end
  end
end
