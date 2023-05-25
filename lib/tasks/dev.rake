desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  User.destroy_all
  Restaurant.destroy_all
  Bookmark.destroy_all
  Outing.destroy_all
  OutingParticipant.destroy_all
  OutingOption.destroy_all
  OutingResponse.destroy_all

  # require 'faker'

  # #Add users
  # 25.times do
  #   user = User.new
  #   user.first_name = Faker::Name.first_name
  #   user.username = Faker::Internet.user('username')[:username]
  #   user.last_name = Faker::Name.last_name
  #   Faker::Internet.username(specifier: "#{user.first_name} #{user.last_name}", separators: %w(. _ -))
  #   user.email = Faker::Internet.email(name: "#{user.first_name}")
  #   user.password = "password"
  #   user.save
  # end
  # p "Added #{User.count} users"

  # #Add restaurants
  # price_points = ["$", "$$", "$$$"]
  # 50.times do
  #   restaurant = Restaurant.new
  #   restaurant.name = Faker::Restaurant.name
  #   restaurant.address = Faker::Address.street_address
  #   restaurant.cuisine = Faker::Restaurant.type
  #   restaurant.price_point = price_points.sample
  #   #restaurant.bookmarks_count = 0
  #   restaurant.save
  # end
  # p "Added #{Restaurant.count} restaurants"
  
  # users = User.all
  # restaurants = Restaurant.all
  # #Add bookmarks
  # 100.times do
  #   bookmark = Bookmark.new
  #   bookmark.restaurant_id = restaurants.sample.id
  #   bookmark.user_id = users.sample.id
  #   bookmark.save
  # end
  # p "Added #{Bookmark.count} bookmarks"

  
  # #Add outings
  # 15.times do
  #   outing = Outing.new
  #   outing.completed = [true, false].sample
  #   outing.sender_id = users.sample.id
  #   outing.save
  # end
  # p "Added #{Outing.count} outings"

  #  #Add participants
  #  num_invites = [2,3,4]
  #  outings = Outing.all
  #  outings.each do |outing|
  #      invite = OutingParticipant.new
  #      invite.outing_id = outing.id
  #      invite.user_id = outing.sender_id
 
  #      if outing.completed
  #        invite.participant_submitted = true
  #      else
  #       invite.participant_submitted = [true, false].sample
  #      end
  #      invite.save
     
  #    num = num_invites.sample
  #    "Outing #{outing.id}"
  #    num.times do
  #      invite = OutingParticipant.new
  #      invite.outing_id = outing.id
  #      invite.user_id = users.sample.id

  #     if outing.completed
  #        invite.participant_submitted = true
  #     else
  #       invite.participant_submitted = [true, false].sample
  #     end
  #     invite.save
  #   end
  #  end
  #  p "Added #{OutingParticipant.count} invites"
 
  #  #Add outing options
  #  outings.each do |outing|
  #    10.times do
  #      option = OutingOption.new
  #      option.outing_id = outing.id
  #      option.restaurant_id = restaurants.sample.id
  #      option.all_participants_selected = [true, false].sample
  #      option.save
  #    end
  #   end
  #  p "Added #{OutingOption.count} options"
 
  #  # #Add outing selections
  #  outings.each do |outing|
  #    the_id = outing.id
  #    outing_options = OutingOption.where({:outing_id => the_id})
  #    outing_invite = OutingParticipant.where({:outing_id => the_id})
  #    outing_options.each do |option|
  #      outing_invite.each do |invite|
  #        out_selection = OutingResponse.new
  #        out_selection.option_id = option.id
  #        out_selection.participant_id = invite.id
  #        if invite.participant_submitted
  #          out_selection.participant_selected = [true, false].sample          
  #        else
  #          out_selection.participant_selected = false
  #        end
  #        out_selection.save
  #      end
  #    end
  #  end
   
  #  p "Added #{OutingResponse.count} options"
 end
