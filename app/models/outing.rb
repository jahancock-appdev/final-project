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
end
