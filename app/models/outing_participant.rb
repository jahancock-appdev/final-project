# == Schema Information
#
# Table name: outing_participants
#
#  id                    :integer          not null, primary key
#  participant_submitted :boolean
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  outing_id             :integer
#  user_id               :integer
#
class OutingParticipant < ApplicationRecord
  belongs_to :participant, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :outing, required: true, class_name: "Outing", foreign_key: "outing_id", counter_cache: true
  has_many  :responses, class_name: "OutingResponse", foreign_key: "participant_id", dependent: :nullify
  validates :user_id, uniqueness: { scope: ["outing_id"] }

end
