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
end
