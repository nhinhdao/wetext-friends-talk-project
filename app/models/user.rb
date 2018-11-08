class User < ApplicationRecord
  has_many :posts
  has_many :messages
  has_many :connections, dependent: :destroy
  has_many :friends, through: :connections, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create

  has_secure_password
end
