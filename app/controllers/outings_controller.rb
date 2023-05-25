class OutingsController < ApplicationController
  def snapshot
    matching_outings = @current_user.outings
    @list_of_outings = matching_outings.order({ :created_at => :desc })
    @outstanding_outings = @current_user.outstanding_outings.order({ :updated_at => :desc })
    @awaiting_outings = @current_user.awaiting_outings.order({ :updated_at => :desc })
    @completed_outings = @current_user.completed_outings.order({ :updated_at => :desc })
    render({template: "outings/snapshot.html.erb"})
  end

  def show
    the_id = params.fetch("path_id")
    #Current_user.specific_outing.status
    #Confirm user has outing
    @matching_outing = @current_user.outings.where({ :id => the_id }).first
    @the_outing = @matching_outing

    #If user does not have permission to see page, reroute
    if @matching_outing == nil
      redirect_to("/outings", { :alert => "You weren't invited to that party."})

    elsif @matching_outing.completed
      #Show results
      render({ :template => "outings/show.html.erb" })
      ###CLEAN UP LATER
    elsif @matching_outing.outing_participants.where({user_id: @current_user.id}).first.participant_submitted
      #Show hold message
      render({ :template => "outings/hold.html.erb" })
    else
      #Prompt user to complete outing response 
      render({ :template => "outings/response_form.html.erb" })
    end  
  end

  def invite
    render({template: "outings/invitation_form.html.erb"})
  end
  def index
    matching_outings = Outing.all

    @list_of_outings = matching_outings.order({ :created_at => :desc })

    render({ :template => "outings/index.html.erb" })
  end


  # def show
  #   the_id = params.fetch("path_id")

  #   matching_outings = Outing.where({ :id => the_id })

  #   @the_outing = matching_outings.at(0)

  #   render({ :template => "outings/show.html.erb" })
  # end

  def create
    the_outing = Outing.new
    the_outing.completed = params.fetch("query_completed", false)
    the_outing.sender_id = params.fetch("query_sender_id")
    # the_outing.outing_participants_count = params.fetch("query_outing_participants_count")

    if the_outing.valid?
      the_outing.save
      #redirect_to("/outings", { :notice => "Outing created successfully." })
    #else
      #redirect_to("/outings", { :alert => the_outing.errors.full_messages.to_sentence })
    end
    #Consider nesting in if and looping for all participants
    the_outing_participant = OutingParticipant.new
    the_outing_participant.outing_id = the_outing.id
    the_outing_participant.user_id = params.fetch("query_user_id")
    the_outing_participant.participant_submitted = params.fetch("query_participant_submitted", false)

    if the_outing_participant.valid?
      the_outing_participant.save
      #redirect_to("/outing_participants", { :notice => "Outing participant created successfully." })
    # else
    #   redirect_to("/outing_participants", { :alert => the_outing_participant.errors.full_messages.to_sentence })
    end
        #Consider nesting in if and looping for all participants
    the_outing_participant = OutingParticipant.new
    the_outing_participant.outing_id = the_outing.id
    the_outing_participant.user_id = the_outing.sender_id
    the_outing_participant.participant_submitted = params.fetch("query_participant_submitted", false)

    if the_outing_participant.valid?
      the_outing_participant.save
      #redirect_to("/outing_participants", { :notice => "Outing participant created successfully." })
    # else
    #   redirect_to("/outing_participants", { :alert => the_outing_participant.errors.full_messages.to_sentence })
    end
    ###Generate outing options
    #Find users invited to this outing
     the_participants = the_outing.participants.map_relation_to_array(:id)
     
    #Find their subset of bookmarked restaurants
    bookmarked_restaurants = Bookmark.where({:user_id => the_participants}).map_relation_to_array(:restaurant_id)
    
    #Dedupe the options and select 10 randomly; how to sample without replacement?
    the_outing_options = Restaurant.where({id: bookmarked_restaurants}).distinct.sample(10)

    the_outing_options.each do |option|
      the_outing_option = OutingOption.new 
      the_outing_option.outing_id = the_outing.id
      the_outing_option.restaurant_id = option.id
      the_outing_option.all_participants_selected = params.fetch("query_all_participants_selected", false)
      the_outing_option.responses_count = params.fetch("query_responses_count", nil)
      if the_outing_option.valid?  
        the_outing_option.save
      end
    end
    ###Need to figure out rerouting

      redirect_to("/outings/#{the_outing.id}", { :notice => "Outing option created successfully." })

  end

  # def create_clean
  #   the_outing = Outing.new
  #   the_outing.completed = params.fetch("query_completed", false)
  #   the_outing.sender_id = params.fetch("query_sender_id")
  #   # the_outing.outing_participants_count = params.fetch("query_outing_participants_count")

  #   if the_outing.valid?
  #     the_outing.save
  #     redirect_to("/outings", { :notice => "Outing created successfully." })
  #   else
  #     redirect_to("/outings", { :alert => the_outing.errors.full_messages.to_sentence })
  #   end
  # end

  def update
    the_id = params.fetch("path_id")
    the_outing = Outing.where({ :id => the_id }).at(0)

    the_outing.completed = params.fetch("query_completed", false)
    the_outing.sender_id = params.fetch("query_sender_id")
    the_outing.outing_participants_count = params.fetch("query_outing_participants_count")

    if the_outing.valid?
      the_outing.save
      redirect_to("/outings/#{the_outing.id}", { :notice => "Outing updated successfully."} )
    else
      redirect_to("/outings/#{the_outing.id}", { :alert => the_outing.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_outing = Outing.where({ :id => the_id }).at(0)

    the_outing.destroy

    redirect_to("/outings", { :notice => "Outing deleted successfully."} )
  end
end
