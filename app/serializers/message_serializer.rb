class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :posted_at
  
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def posted_at
    self.object.updated_at.strftime('%D %r')
  end
end
