class CreateSmsMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :sms_messages, id: :uuid, default: -> { "uuid_generate_v4()" } do |t|
      t.text :context
      t.uuid :phone_id, foreign_key: true
      t.datetime :sent_on

      t.timestamps
    end
  end
end
