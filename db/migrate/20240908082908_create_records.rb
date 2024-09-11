class CreateRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true
      t.date :date, null: false, default: -> { '(CURRENT_DATE)' }
      t.time :started_time, null: false
      t.time :finished_time, null: false
      t.string :content
      t.text :memo
      t.timestamps
    end
  end
end
