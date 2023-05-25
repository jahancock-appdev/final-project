class CreateRestaurantCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_categories do |t|
      t.integer :category_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
