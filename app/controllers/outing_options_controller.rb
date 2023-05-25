class OutingOptionsController < ApplicationController
 
  def create
     #Find users invited to this outing
     #the_outing = [[TBD]]
     the_participants = Outing.find_by({id: the_outing}).participants. map_relation_to_array(:id)
     
    #Find their subset of bookmarked restaurants
    bookmarked_restaurants = Bookmark.where({:user_id => the_participants}).map_relation_to_array(:restaurant_id)
    
    #Dedupe the options and select 10 randomly; how to sample without replacement?
    the_outing_options = Restaurant.where({id: bookmarked_restaurants}).distinct.sample(10)

    the_outing_options.each do |option|
      the_outing_option = OutingOption.new 
      the_outing_option.outing_id = params.fetch("query_outing_id")
      the_outing_option.restaurant_id = option.id
      the_outing_option.all_participants_selected = params.fetch("query_all_participants_selected", false)
      the_outing_option.responses_count = params.fetch("query_responses_count")
      if the_outing_option.valid?  
        the_outing_option.save
      end
    end
    ###Need to figure out rerouting
    if the_outing_option.valid?
      the_outing_option.save
      redirect_to("/outing_options", { :notice => "Outing option created successfully." })
    else
      redirect_to("/outing_options", { :alert => the_outing_option.errors.full_messages.to_sentence })
    end
  end

end
