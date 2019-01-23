class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :updated_at
  
  belongs_to :user
  belongs_to :friends, class_name: 'User'
end
