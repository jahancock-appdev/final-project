# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  outing_id  :integer
#  user_id    :integer
#
class Invitation < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :outing, required: true, class_name: "Outing", foreign_key: "outing_id"
  has_many  :outing_selections, class_name: "OutingSelection", foreign_key: "invitation_id", dependent: :destroy
end
