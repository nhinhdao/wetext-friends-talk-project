class Message < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :content, presence: true
  validates :friend_id, presence: true

  default_scope {order(created_at: :desc)}
  scope :inbox, ->(user) { where(:friend_id => user.id) }
end
