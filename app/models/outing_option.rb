# == Schema Information
#
# Table name: outing_options
#
#  id                        :integer          not null, primary key
#  all_participants_selected :boolean
#  responses_count           :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  outing_id                 :integer
#  restaurant_id             :integer
#
class OutingOption < ApplicationRecord
  belongs_to :restaurant, required: true, class_name: "Restaurant", foreign_key: "restaurant_id"
  belongs_to :outing, required: true, class_name: "Outing", foreign_key: "outing_id"
  has_many  :responses, class_name: "OutingResponse", foreign_key: "option_id", dependent: :destroy
  def selected
    total_part = self.outing.outing_participants_count
    return self.responses_count == total_part
  end
end
