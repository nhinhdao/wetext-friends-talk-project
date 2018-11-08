class Message < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :mcontent, presence: true
end
