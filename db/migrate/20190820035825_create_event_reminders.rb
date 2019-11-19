class CreateEventReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :event_reminders, id: :uuid, default: -> { "uuid_generate_v4()" } do |t|
      t.uuid :event_id, foreign_key: true
      t.uuid :user_id, foreign_key: true
      t.datetime :created_at
      t.datetime :trigger_at

      t.timestamps
    end
  end
end
