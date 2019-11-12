class AddPriceToBoat < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :price, :float
  end
end
