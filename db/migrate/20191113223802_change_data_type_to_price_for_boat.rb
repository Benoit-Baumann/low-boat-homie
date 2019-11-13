class ChangeDataTypeToPriceForBoat < ActiveRecord::Migration[5.2]
  def change
    change_column :boats, :price, :integer
  end
end
