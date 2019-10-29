class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :starts_at
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
