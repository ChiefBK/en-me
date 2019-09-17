class CreateEventReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :event_reminders do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :created_at
      t.datetime :trigger_at

      t.timestamps
    end
  end
end
