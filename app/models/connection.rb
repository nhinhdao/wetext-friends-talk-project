class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def get_ids
    ids = {}
    ids["user_id"] = self.friend_id
    ids['friend_id'] = self.user_id
    ids
  end
end
