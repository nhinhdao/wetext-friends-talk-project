class User < ApplicationRecord
  has_many :posts
  has_many :messages
  has_many :connections, dependent: :destroy
  has_many :friends, through: :connections, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true

  has_secure_password

  scope :not_current_user, ->(user) { where.not(:id => user.id) }

  def self.other_users(user)
    not_current_user(user) - user.friends
  end

  def friend_with?(user)
    self != user && self.friends.include?(user)
  end

  def not_a_friend?(user)
    self != user && !self.friends.include?(user)
  end
end
