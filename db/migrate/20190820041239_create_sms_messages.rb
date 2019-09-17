class CreateSmsMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :sms_messages do |t|
      t.text :context
      t.references :phone, foreign_key: true
      t.datetime :sent_on

      t.timestamps
    end
  end
end
