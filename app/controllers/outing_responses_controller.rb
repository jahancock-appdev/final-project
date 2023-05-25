class OutingResponsesController < ApplicationController
  
  def create
    selected_options = params.fetch("interest")
    outing_id = params.fetch("query_outing_id")
    #Participant ID should be better tracked so not having to do this; look into associations
    invite = @current_user.invitations.find_by(outing_id: outing_id)

    # render({:template => "outing_responses/temp_dummy.html.erb"})
    selected_options.each do |selection|
      the_outing_response = OutingResponse.new
      the_outing_response.option_id = selection
      the_outing_response.participant_id = invite.id
      the_outing_response.participant_selected = params.fetch("query_participant_selected", true)
      if the_outing_response.valid?
        the_outing_response.save
      end
    end
    #Update participants status
    invite.participant_submitted = true
    invite.save
    
    #Updates of outing status
    if invite.outing.ready
       invite.outing.completed = true
       invite.outing.save
       the_outing_options = invite.outing.outing_options
       the_outing_options.each do |option|
         if option.selected
           option.all_participants_selected = true
           option.save
         end
       end
     end
    #if the_outing_response.valid?
    ##Redirect to outing page after participants status is updated
    redirect_to("/outings/#{outing_id}", { :notice => "Outing response created successfully." })
    # else
    #   redirect_to("/outing_responses", { :alert => the_outing_response.errors.full_messages.to_sentence })
    # end
    
  end

  end
