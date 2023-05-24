class OutingResponsesController < ApplicationController
  def index
    matching_outing_responses = OutingResponse.all

    @list_of_outing_responses = matching_outing_responses.order({ :created_at => :desc })

    render({ :template => "outing_responses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_outing_responses = OutingResponse.where({ :id => the_id })

    @the_outing_response = matching_outing_responses.at(0)

    render({ :template => "outing_responses/show.html.erb" })
  end

  def create
    the_outing_response = OutingResponse.new
    the_outing_response.option_id = params.fetch("query_option_id")
    the_outing_response.participant_id = params.fetch("query_participant_id")
    the_outing_response.participant_selected = params.fetch("query_participant_selected", false)

    if the_outing_response.valid?
      the_outing_response.save
      redirect_to("/outing_responses", { :notice => "Outing response created successfully." })
    else
      redirect_to("/outing_responses", { :alert => the_outing_response.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_outing_response = OutingResponse.where({ :id => the_id }).at(0)

    the_outing_response.option_id = params.fetch("query_option_id")
    the_outing_response.participant_id = params.fetch("query_participant_id")
    the_outing_response.participant_selected = params.fetch("query_participant_selected", false)

    if the_outing_response.valid?
      the_outing_response.save
      redirect_to("/outing_responses/#{the_outing_response.id}", { :notice => "Outing response updated successfully."} )
    else
      redirect_to("/outing_responses/#{the_outing_response.id}", { :alert => the_outing_response.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_outing_response = OutingResponse.where({ :id => the_id }).at(0)

    the_outing_response.destroy

    redirect_to("/outing_responses", { :notice => "Outing response deleted successfully."} )
  end
end
