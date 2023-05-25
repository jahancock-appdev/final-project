# == Schema Information
#
# Table name: outings
#
#  id                        :integer          not null, primary key
#  completed                 :boolean
#  outing_participants_count :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  sender_id                 :integer
#
class Outing < ApplicationRecord
  belongs_to :sender, required: true, class_name: "User", foreign_key: "sender_id"
  has_many  :outing_participants, class_name: "OutingParticipant", foreign_key: "outing_id", dependent: :destroy
  has_many  :outing_options, class_name: "OutingOption", foreign_key: "outing_id", dependent: :destroy
  has_many  :selected_options, ->{where all_participants_selected: true}, class_name: "OutingOption", foreign_key: "outing_id", dependent: :destroy

  has_many :participants, through: :outing_participants, source: :participant
  def ready
    num_submitted = self.outing_participants.where({participant_submitted: true}).count
    return self.outing_participants_count == num_submitted
  end
end
