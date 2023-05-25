class RestaurantCategoriesController < ApplicationController
  def index
    matching_restaurant_categories = RestaurantCategory.all

    @list_of_restaurant_categories = matching_restaurant_categories.order({ :created_at => :desc })

    render({ :template => "restaurant_categories/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_restaurant_categories = RestaurantCategory.where({ :id => the_id })

    @the_restaurant_category = matching_restaurant_categories.at(0)

    render({ :template => "restaurant_categories/show.html.erb" })
  end

  def create
    the_restaurant_category = RestaurantCategory.new
    the_restaurant_category.category_id = params.fetch("query_category_id")
    the_restaurant_category.restaurant_id = params.fetch("query_restaurant_id")

    if the_restaurant_category.valid?
      the_restaurant_category.save
      redirect_to("/restaurant_categories", { :notice => "Restaurant category created successfully." })
    else
      redirect_to("/restaurant_categories", { :alert => the_restaurant_category.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_restaurant_category = RestaurantCategory.where({ :id => the_id }).at(0)

    the_restaurant_category.category_id = params.fetch("query_category_id")
    the_restaurant_category.restaurant_id = params.fetch("query_restaurant_id")

    if the_restaurant_category.valid?
      the_restaurant_category.save
      redirect_to("/restaurant_categories/#{the_restaurant_category.id}", { :notice => "Restaurant category updated successfully."} )
    else
      redirect_to("/restaurant_categories/#{the_restaurant_category.id}", { :alert => the_restaurant_category.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_restaurant_category = RestaurantCategory.where({ :id => the_id }).at(0)

    the_restaurant_category.destroy

    redirect_to("/restaurant_categories", { :notice => "Restaurant category deleted successfully."} )
  end
end
