class OutingsController < ApplicationController
  def index
    matching_outings = Outing.all

    @list_of_outings = matching_outings.order({ :created_at => :desc })

    render({ :template => "outings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_outings = Outing.where({ :id => the_id })

    @the_outing = matching_outings.at(0)

    render({ :template => "outings/show.html.erb" })
  end

  def create
    the_outing = Outing.new
    the_outing.completed = params.fetch("query_completed", false)
    the_outing.sender_id = params.fetch("query_sender_id")
    the_outing.outing_participants_count = params.fetch("query_outing_participants_count")

    if the_outing.valid?
      the_outing.save
      redirect_to("/outings", { :notice => "Outing created successfully." })
    else
      redirect_to("/outings", { :alert => the_outing.errors.full_messages.to_sentence })
    end
  end

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
