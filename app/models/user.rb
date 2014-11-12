class User < ActiveRecord::Base

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :photos # created photos
  has_many :likes

  has_many :liked_photos, :through => :likes, :source => :photo # liked photos

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
