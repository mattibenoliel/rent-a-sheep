class RenameSheepToSheeps < ActiveRecord::Migration[5.2]
  def change
    rename_table :sheep, :sheeps

  end
end
