class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones, id: :uuid, default: -> { "uuid_generate_v4()" } do |t|
      t.string :phone_number
      t.boolean :is_primary
      t.uuid :user_id, foreign_key: true

      t.timestamps
    end
  end
end
