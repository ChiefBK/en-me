class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations, id: :uuid, default: -> { "uuid_generate_v4()" } do |t|
      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
