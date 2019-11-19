class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events, id: :uuid, default: -> { "uuid_generate_v4()" } do |t|
      t.string :name
      t.datetime :starts_at
      t.uuid :location_id, foreign_key: true

      t.timestamps
    end
  end
end
