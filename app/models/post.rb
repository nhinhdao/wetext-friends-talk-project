class Post < ApplicationRecord
  belongs_to :user

  validates :pcontent, presence: true

  scope :new_feeds, ->(user) { where.not(user_id: user.id) }
end
