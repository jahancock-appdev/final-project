desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  require 'faker'

  #Add users
  25.times do
    user = User.new
    user.username = Faker::Internet.user('username')
    user.first_name = Faker::Name.first_name
    user.last_name = Faker::Name.last_name
    user.email = Faker::Internet.email
    user.password = "password"
    user.save
  end

  #Add restaurants
  price_points = ["$", "$$", "$$$"]
  50.times do
    restaurant = Restaurant.new
    restaurant.name = Faker::Restaurant.name
    restaurant.address = Faker::Address.street_address
    restaurant.cuisine = Faker::Restaurant.type
    restaurant.price_point = price_points.sample
    restaurant.bookmarks_count = 0
    restaurant.save
  end

  users = User.all
  restaurants = Restaurant.all
  #Add bookmarks
  100.times do
    bookmark = Bookmark.new
    bookmark.restaurant_id = restaurants.sample.id
    bookmark.user_id = users.sample.id
    bookmark.save
  end

  #Add outings
  status = ["In progress", "Complete"]
  15 times do
    outing = Outing.new
    outing.status = status.sample
    outing.save
  end

end
