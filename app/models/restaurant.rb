# == Schema Information
#
# Table name: restaurants
#
#  id               :integer          not null, primary key
#  address          :string
#  bookmarks_count  :integer
#  city             :string
#  latitude         :float
#  longitude        :float
#  name             :string
#  postal_code      :string
#  review_count     :integer
#  stars            :float
#  state            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  yelp_business_id :string
#
class Restaurant < ApplicationRecord
  has_many  :bookmarks, class_name: "Bookmark", foreign_key: "restaurant_id", dependent: :destroy
  has_many  :outing_options, class_name: "OutingOption", foreign_key: "restaurant_id", dependent: :nullify
  validates :name, presence: true
end
