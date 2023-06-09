# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_many(:restaurant_categories, { :dependent => :destroy })
  has_many(:restaurants, { :through => :restaurant_categories, :source => :restaurant })
end
