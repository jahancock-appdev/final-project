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
end
