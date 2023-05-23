# == Schema Information
#
# Table name: outings
#
#  id         :integer          not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Outing < ApplicationRecord
  has_many  :invitations, class_name: "Invitation", foreign_key: "outing_id", dependent: :destroy
  has_many  :outing_options, class_name: "OutingOption", foreign_key: "outing_id", dependent: :destroy
  has_many :users, through: :invitations, source: :user
  has_many :outing_selections, through: :outing_options, source: :outing_selections
end
