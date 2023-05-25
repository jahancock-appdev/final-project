# == Schema Information
#
# Table name: restaurant_categories
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  category_id   :integer
#  restaurant_id :integer
#
class RestaurantCategory < ApplicationRecord
end
