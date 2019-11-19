class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites, id: :uuid, default: -> { "uuid_generate_v4()" } do |t|
      t.uuid :user_id, foreign_key: true
      t.uuid :event_id, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
