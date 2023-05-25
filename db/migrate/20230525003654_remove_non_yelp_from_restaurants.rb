class RemoveNonYelpFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :cuisine, :string
    remove_column :restaurants, :price_point, :string
  end
end
