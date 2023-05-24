# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  bookmarks_count :integer
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many  :bookmarks, class_name: "Bookmark", foreign_key: "user_id", dependent: :destroy
  has_many  :sent_outings, class_name: "Outing", foreign_key: "sender_id", dependent: :nullify
  has_many  :invitations, class_name: "OutingParticipant", foreign_key: "user_id", dependent: :nullify
  has_many :outings, through: :invitations, source: :outing
end
