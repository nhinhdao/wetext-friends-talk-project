class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :updated_at
  belongs_to :user
end
