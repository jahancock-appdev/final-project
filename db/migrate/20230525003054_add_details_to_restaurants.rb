class AddDetailsToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :city, :string
    add_column :restaurants, :state, :string
    add_column :restaurants, :postal_code, :string
    add_column :restaurants, :latitude, :float
    add_column :restaurants, :yelp_business_id, :string
    add_column :restaurants, :longitude, :float
    add_column :restaurants, :stars, :float
    add_column :restaurants, :review_count, :integer
  end
end
