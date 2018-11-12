class Post < ApplicationRecord
  belongs_to :user

  validates :pcontent, presence: true

  scope :new_feeds, -> {order(created_at: :desc)}
end
