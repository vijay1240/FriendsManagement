class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions
  has_many :mutual_friendships, class_name: 'Friendship', foreign_key: :friend_id
  has_many :mutual_friends, through: :mutual_friendships, source: :user
  attribute :message, :string
  validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  scope :unblocked_subscribers, -> {joins(:subscriptions).where(subscriptions: {blocked: false})}

  def self.mutual_friends_list(user, friend)
    (user.friends & friend.friends).uniq
  end

  def find_or_create_subscriptions(target_id)
    self.subscriptions.find_or_create_by(target_id: target_id)
  end


end
