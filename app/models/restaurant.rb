# == Schema Information
#
# Table name: restaurants
#
#  id              :integer          not null, primary key
#  address         :string
#  bookmarks_count :integer
#  cuisine         :string
#  name            :string
#  price_point     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Restaurant < ApplicationRecord
  has_many  :bookmarks, class_name: "Bookmark", foreign_key: "restaurant_id", dependent: :destroy
  has_many  :outing_options, class_name: "OutingOption", foreign_key: "restaurant_id", dependent: :nullify
  validates :name, presence: true
end
