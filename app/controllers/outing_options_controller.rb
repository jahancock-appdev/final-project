class OutingOptionsController < ApplicationController
  def index
    matching_outing_options = OutingOption.all

    @list_of_outing_options = matching_outing_options.order({ :created_at => :desc })

    render({ :template => "outing_options/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_outing_options = OutingOption.where({ :id => the_id })

    @the_outing_option = matching_outing_options.at(0)

    render({ :template => "outing_options/show.html.erb" })
  end

  def create
    the_outing_option = OutingOption.new
    the_outing_option.outing_id = params.fetch("query_outing_id")
    the_outing_option.restaurant_id = params.fetch("query_restaurant_id")

    if the_outing_option.valid?
      the_outing_option.save
      redirect_to("/outing_options", { :notice => "Outing option created successfully." })
    else
      redirect_to("/outing_options", { :alert => the_outing_option.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_outing_option = OutingOption.where({ :id => the_id }).at(0)

    the_outing_option.outing_id = params.fetch("query_outing_id")
    the_outing_option.restaurant_id = params.fetch("query_restaurant_id")

    if the_outing_option.valid?
      the_outing_option.save
      redirect_to("/outing_options/#{the_outing_option.id}", { :notice => "Outing option updated successfully."} )
    else
      redirect_to("/outing_options/#{the_outing_option.id}", { :alert => the_outing_option.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_outing_option = OutingOption.where({ :id => the_id }).at(0)

    the_outing_option.destroy

    redirect_to("/outing_options", { :notice => "Outing option deleted successfully."} )
  end
end
