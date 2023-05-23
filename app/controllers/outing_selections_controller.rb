class OutingSelectionsController < ApplicationController
  def index
    matching_outing_selections = OutingSelection.all

    @list_of_outing_selections = matching_outing_selections.order({ :created_at => :desc })

    render({ :template => "outing_selections/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_outing_selections = OutingSelection.where({ :id => the_id })

    @the_outing_selection = matching_outing_selections.at(0)

    render({ :template => "outing_selections/show.html.erb" })
  end

  def create
    the_outing_selection = OutingSelection.new
    the_outing_selection.option_id = params.fetch("query_option_id")
    the_outing_selection.invitation_id = params.fetch("query_invitation_id")
    the_outing_selection.status = params.fetch("query_status")

    if the_outing_selection.valid?
      the_outing_selection.save
      redirect_to("/outing_selections", { :notice => "Outing selection created successfully." })
    else
      redirect_to("/outing_selections", { :alert => the_outing_selection.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_outing_selection = OutingSelection.where({ :id => the_id }).at(0)

    the_outing_selection.option_id = params.fetch("query_option_id")
    the_outing_selection.invitation_id = params.fetch("query_invitation_id")
    the_outing_selection.status = params.fetch("query_status")

    if the_outing_selection.valid?
      the_outing_selection.save
      redirect_to("/outing_selections/#{the_outing_selection.id}", { :notice => "Outing selection updated successfully."} )
    else
      redirect_to("/outing_selections/#{the_outing_selection.id}", { :alert => the_outing_selection.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_outing_selection = OutingSelection.where({ :id => the_id }).at(0)

    the_outing_selection.destroy

    redirect_to("/outing_selections", { :notice => "Outing selection deleted successfully."} )
  end
end
