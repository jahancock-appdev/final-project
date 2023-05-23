# == Schema Information
#
# Table name: outing_options
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  outing_id     :integer
#  restaurant_id :integer
#
class OutingOption < ApplicationRecord
  belongs_to :restaurant, required: true, class_name: "Restaurant", foreign_key: "restaurant_id"
  belongs_to :outing, required: true, class_name: "Outing", foreign_key: "outing_id"
  has_many  :outing_selections, class_name: "OutingSelection", foreign_key: "option_id", dependent: :destroy
end
