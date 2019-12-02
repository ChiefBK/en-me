class CreateTemporaryPasswords < ActiveRecord::Migration[5.2]
  def change
    create_table :temporary_passwords, id: :uuid, default: -> { "uuid_generate_v4()" } do |t|
      t.string :password
      t.uuid :user_id, foreign_key: true

      t.timestamps
    end
  end
end
