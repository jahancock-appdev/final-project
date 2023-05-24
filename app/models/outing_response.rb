# == Schema Information
#
# Table name: outing_responses
#
#  id                   :integer          not null, primary key
#  participant_selected :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  option_id            :integer
#  participant_id       :integer
#
class OutingResponse < ApplicationRecord
end
