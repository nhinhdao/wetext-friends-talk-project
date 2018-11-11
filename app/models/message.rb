class Message < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :mcontent, presence: true

  scope :inbox, ->(user) { where(:friend_id => user.id) }
end
