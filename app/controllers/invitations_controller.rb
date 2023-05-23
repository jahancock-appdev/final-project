class InvitationsController < ApplicationController
  def index
    matching_invitations = Invitation.all

    @list_of_invitations = matching_invitations.order({ :created_at => :desc })

    render({ :template => "invitations/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_invitations = Invitation.where({ :id => the_id })

    @the_invitation = matching_invitations.at(0)

    render({ :template => "invitations/show.html.erb" })
  end

  def create
    the_invitation = Invitation.new
    the_invitation.outing_id = params.fetch("query_outing_id")
    the_invitation.user_id = params.fetch("query_user_id")
    the_invitation.status = "In progress"

    if the_invitation.valid?
      the_invitation.save
      redirect_to("/outings/#{the_invitation.outing_id}", { :notice => "Invitation created successfully." })
    else
      redirect_to("/outings/#{the_invitation.outing_id}", { :alert => the_invitation.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_invitation = Invitation.where({ :id => the_id }).at(0)

    the_invitation.outing_id = params.fetch("query_outing_id")
    the_invitation.user_id = params.fetch("query_user_id")
    the_invitation.status = params.fetch("query_status")

    if the_invitation.valid?
      the_invitation.save
      redirect_to("/invitations/#{the_invitation.id}", { :notice => "Invitation updated successfully."} )
    else
      redirect_to("/invitations/#{the_invitation.id}", { :alert => the_invitation.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_invitation = Invitation.where({ :id => the_id }).at(0)

    the_invitation.destroy

    redirect_to("/invitations", { :notice => "Invitation deleted successfully."} )
  end
end
