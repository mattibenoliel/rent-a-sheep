class AddAddressToSheeps < ActiveRecord::Migration[5.2]
  def change
    add_column :sheeps, :address, :string
    add_column :sheeps, :latitude, :float
    add_column :sheeps, :longitude, :float
  end
end
