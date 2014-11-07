class Photo < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  has_many :comments
  has_many :likes

  has_many :liked_users, :through => :likes, :source => :user

  def can_be_liked?(user)
    self.likes.where(user_id: user.id).empty?
  end
end
