# == Schema Information
#
# Table name: outing_selections
#
#  id            :integer          not null, primary key
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  invitation_id :integer
#  option_id     :integer
#
class OutingSelection < ApplicationRecord
  belongs_to :option, required: true, class_name: "OutingOption", foreign_key: "option_id"
  belongs_to :invitation, required: true, class_name: "Invitation", foreign_key: "invitation_id"
end
