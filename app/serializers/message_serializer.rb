class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :updated_at
  
  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
