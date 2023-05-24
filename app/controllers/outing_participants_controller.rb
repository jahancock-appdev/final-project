class OutingParticipantsController < ApplicationController
  def index
    matching_outing_participants = OutingParticipant.all

    @list_of_outing_participants = matching_outing_participants.order({ :created_at => :desc })

    render({ :template => "outing_participants/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_outing_participants = OutingParticipant.where({ :id => the_id })

    @the_outing_participant = matching_outing_participants.at(0)

    render({ :template => "outing_participants/show.html.erb" })
  end

  def create
    the_outing_participant = OutingParticipant.new
    the_outing_participant.outing_id = params.fetch("query_outing_id")
    the_outing_participant.user_id = params.fetch("query_user_id")
    the_outing_participant.participant_submitted = params.fetch("query_participant_submitted", false)

    if the_outing_participant.valid?
      the_outing_participant.save
      redirect_to("/outing_participants", { :notice => "Outing participant created successfully." })
    else
      redirect_to("/outing_participants", { :alert => the_outing_participant.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_outing_participant = OutingParticipant.where({ :id => the_id }).at(0)

    the_outing_participant.outing_id = params.fetch("query_outing_id")
    the_outing_participant.user_id = params.fetch("query_user_id")
    the_outing_participant.participant_submitted = params.fetch("query_participant_submitted", false)

    if the_outing_participant.valid?
      the_outing_participant.save
      redirect_to("/outing_participants/#{the_outing_participant.id}", { :notice => "Outing participant updated successfully."} )
    else
      redirect_to("/outing_participants/#{the_outing_participant.id}", { :alert => the_outing_participant.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_outing_participant = OutingParticipant.where({ :id => the_id }).at(0)

    the_outing_participant.destroy

    redirect_to("/outing_participants", { :notice => "Outing participant deleted successfully."} )
  end
end
