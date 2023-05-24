class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :cuisine
      t.string :price_point
      t.integer :bookmarks_count

      t.timestamps
    end
  end
end
