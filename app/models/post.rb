class Post < ApplicationRecord
  belongs_to :user

  validates :pcontent, presence: true
end
