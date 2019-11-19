class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: :uuid, default: -> { "uuid_generate_v4()" } do |t|
      t.string :name
      t.uuid :user_id, foreign_key: true
      t.uuid :event_id, foreign_key: true

      t.timestamps
    end
  end
end
