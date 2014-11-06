class User < ActiveRecord::Base
  has_many :photos
  has_many :comments, :through => :photos
end
