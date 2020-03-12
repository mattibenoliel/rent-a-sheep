class AddCoordinatesToSheep < ActiveRecord::Migration[5.2]
  def change
    add_column :sheep, :address, :string
    add_column :sheep, :latitude, :float
    add_column :sheep, :longitude, :float
  end
end
