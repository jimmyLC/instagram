class User < ActiveRecord::Base

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => :friend_id
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :follower

  has_many :photos # created photos
  has_many :likes

  has_many :liked_photos, :through => :likes, :source => :photo # liked photos

  def all_friends
    friends + inverse_friends
  end

  def is_friend?(user)
    all_friends.include?(user)
  end

  def can_add_friend?(user)
    !is_friend?(user) && self != user
  end

  def add_friend(user)
    if can_add_friend?(user)
      self.friendships.where( :friend => user ).create!
    end
  end

  def remove_friend(user)
    if is_friend?(user)
      self.friendships.where( :friend => user ).destroy_all
      self.inverse_friendships.where( :user => user ).destroy_all
    end
  end

  def self.from_omniauth(auth_hash)
    user = where(:fb_uid => auth_hash[:uid]).first_or_initialize
    user.name = auth_hash[:info][:name]
    user.email = auth_hash[:info][:email]
    user.fb_token = auth_hash[:credentials][:token]
    user.fb_expires_at = Time.at(auth_hash[:credentials][:expires_at])
    user.save!
    user
  end


end
