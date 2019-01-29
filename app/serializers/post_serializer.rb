class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :posted_at
  
  belongs_to :user

  def posted_at
    self.object.updated_at.strftime('%D %r')
  end
end
