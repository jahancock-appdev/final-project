desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  require "csv"

  User.destroy_all
  Bookmark.destroy_all
  Outing.destroy_all
  OutingParticipant.destroy_all
  OutingOption.destroy_all
  OutingResponse.destroy_all

  require 'faker'

  #Add users
  100.times do
    user = User.new
    user.first_name = Faker::Name.first_name
    user.username = Faker::Internet.user('username')[:username]
    user.last_name = Faker::Name.last_name
    Faker::Internet.username(specifier: "#{user.first_name} #{user.last_name}", separators: %w(. _ -))
    user.email = Faker::Internet.email(name: "#{user.first_name}")
    user.password = "password"
    user.save
  end
  p "Added #{User.count} users"

  
  users = User.all
  restaurants = Restaurant.all
  #Add bookmarks
  users.each do |user|
    rand(5..30).times do
      bookmark = Bookmark.new
      bookmark.restaurant_id = restaurants.sample.id
      bookmark.user_id = user.id
      bookmark.save
    end
  end
    p "Added #{Bookmark.count} bookmarks"

  
  #Add outings
  users.each do |user|
    rand(0..10).times do
      outing = Outing.new
      outing.sender_id = user.id
      outing.save
    end
end
  p "Added #{Outing.count} outings"
  submissions = [true, true, true, true, true, true, true, false, false]
   #Add participants
   outings = Outing.all
   outings.each do |outing|
       invite = OutingParticipant.new
       invite.outing_id = outing.id
       invite.user_id = outing.sender_id
       invite.participant_submitted = submissions.sample
       invite.save
    
     rand(1..4).times do
       invite = OutingParticipant.new
       invite.outing_id = outing.id
       invite.user_id = users.sample.id
       invite.participant_submitted = submissions.sample
       invite.save
    end
   end
   p "Added #{OutingParticipant.count} invites"
 
   #Add outing options
   outings.each do |outing|
    the_participants = outing.participants. map_relation_to_array(:id)
     
    #Find their subset of bookmarked restaurants
    bookmarked_restaurants = Bookmark.where({:user_id => the_participants}).map_relation_to_array(:restaurant_id)
    
    #Dedupe the options and select 10 randomly; how to sample without replacement?
    the_outing_options = Restaurant.where({id: bookmarked_restaurants}).distinct.sample(10)
     the_outing_options.each do |option|
       option = OutingOption.new
       option.outing_id = outing.id
       option.restaurant_id = option.id
       option.save
     end
    end
   p "Added #{OutingOption.count} options"
 
   # #Add outing selections
   outings.each do |outing|
     the_id = outing.id
     outing_options = outing.outing_options
     outing_invite = outing.outing_participants.where({:participant_submitted => true})
     outing_invite.each do |invite|
      outing_options.each do |option|
    #Use 60ish percent probability they select restaurant
       if rand(0..10)<= 6
         out_selection = OutingResponse.new
         out_selection.option_id = option.id
         out_selection.participant_id = invite.id
         out_selection.save
       end
      end
     end
   end
   
   p "Added #{OutingResponse.count} options"
 end
