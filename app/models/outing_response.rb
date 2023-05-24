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
  belongs_to :option, required: true, class_name: "OutingOption", foreign_key: "option_id", counter_cache: :responses_count
  belongs_to :participant, required: true, class_name: "OutingParticipant", foreign_key: "participant_id"
end
