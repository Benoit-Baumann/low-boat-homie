class AddRatingToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :rating, :integer, default: 0
  end
end
