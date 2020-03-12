class AddDescriptionToSheep < ActiveRecord::Migration[5.2]
  def change
    add_column :sheep, :description, :text
  end
end
