# == Schema Information
#
# Table name: outing_options
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  outing_id     :integer
#  restaurant_id :integer
#
class OutingOption < ApplicationRecord
end
