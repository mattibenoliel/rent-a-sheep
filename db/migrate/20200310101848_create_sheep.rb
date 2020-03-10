class CreateSheep < ActiveRecord::Migration[5.2]
  def change
    create_table :sheep do |t|
      t.string :nickname
      t.integer :square_meter_per_hour
      t.boolean :available
      t.integer :price_per_day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
