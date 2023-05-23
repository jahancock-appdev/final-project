# == Schema Information
#
# Table name: restaurants
#
#  id              :integer          not null, primary key
#  address         :string
#  bookmarks_count :integer
#  cuisine         :string
#  name            :string
#  price_point     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Restaurant < ApplicationRecord
end
