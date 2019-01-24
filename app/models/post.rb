class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
  notifyor messages: {
      create: -> (model) { "My Message for model #{model.id}." },
      update: -> (model) { "My Message for model #{model.id}." },
      destroy: -> (model) { "My Message for model #{model.id}." }
  }

  default_scope {order(created_at: :desc)}
end
