desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  User.destroy_all
  Restaurant.destroy_all
  Bookmark.destroy_all
  Outing.destroy_all
  Invitation.destroy_all
  OutingOption.destroy_all
  OutingSelection.destroy_all

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
  15.times do
    outing = Outing.new
    outing.status = status.sample
    outing.save
  end

  #Add invitations
  num_invites = [2,3,4]
  outings = Outing.all
  outings.each do |outing|
    num = num_invites.sample
    
    num.times do
      invite = Invitation.new
      invite.outing_id = outing.id
      invite.user_id = users.sample

      if outing.status == "Complete"
        invite.status = "Complete"
      else
       invite.status = status.sample
      end
      invite.save
    end
  end

  #Add outing options
  outings.each do |outing|
    
    10.times do
      option = OutingOption.new
      option.outing_id = outing.id
      option.restaurant_id = restaurant.sample
      option.save
    end
  end

  #Add outing selections
  outing_options = OutingOption.all
  outings.each do |outing|
    the_id = outing.id
    outing_options = OutingOption.where({:outing_id => the_id})
    outing_invite = Invitation.where({:outing_id => the_id})
    outing_options.each do |option|
      outing_invite.each do |invite|
        out_selection = OutingSelection.new
        out_selection.option_id = option.id
        out_selection.invitation_id = invite.id
        if invite.status == "Complete"
          out_selection.status = ["Accept", "Reject"].sample          
        else
          out_selection.status = "In progress"
        end
        out_selection.save
      end
    end
  end
  
end
