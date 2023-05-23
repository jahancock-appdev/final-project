class OutingsController < ApplicationController
  def index
    matching_outings = @current_user.outings
    #matching_outings = Outing.all

    @list_of_outings = matching_outings.order({ :created_at => :desc })

    render({ :template => "outings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_outings = Outing.where({ :id => the_id })

    @the_outing = matching_outings.at(0)

    @list_of_invitations = @the_outing.invitations

    render({ :template => "outings/show.html.erb" })
  end

  def create
    the_outing = Outing.new
    #the_outing.status = params.fetch("query_status")
    the_outing.status = "In progress"
    if the_outing.valid?
      the_outing.save

      #Generate invite to track user who generated outing
      the_invite = Invitation.new

      the_invite.outing_id = the_outing.id
      the_invite.user_id = @current_user.id
      the_invite.status = "In progress"
        if the_invite.valid?
          the_invite.save
          redirect_to("/outings/#{the_outing.id}", { :notice => "Outing created successfully." })
        else
          redirect_to("/outings", { :alert => the_invite.errors.full_messages.to_sentence })
        end
    else
      redirect_to("/outings", { :alert => the_outing.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_outing = Outing.where({ :id => the_id }).at(0)

    the_outing.status = params.fetch("query_status")

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
