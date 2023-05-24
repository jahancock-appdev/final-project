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
end
