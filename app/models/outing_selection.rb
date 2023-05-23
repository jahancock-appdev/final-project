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
end
