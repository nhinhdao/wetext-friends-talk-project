class Message < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :content, presence: true
  validates :friend_id, presence: true

  default_scope {order(created_at: :desc)}
  # scope :inbox, ->(user) { where(:friend_id => user.id) }
  def self.inbox(user)
    Message.all.select{|msg| msg.user == user || msg.friend == user}
  end

  def self.uniq_users(message)
    user = message.map{|msg| msg.user}
    friend = message.map{|msg| msg.friend}
    (user + friend).uniq
  end

  def owner_ids
    ids = []
    ids << self.user.id << self.friend.id
    ids
  end

  def self.pair_messages(pair_ids)
    self.select{|msg| msg.owner_ids == pair_ids || msg.owner_ids == pair_ids.reverse}
  end
end
