class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :image
  has_many :posts
  has_many :messages
end
