class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.references :owner, foreign_key: { to_table: :users }
      t.string :type
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
