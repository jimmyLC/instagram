class Photo < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :comments
  has_many :taggings
  has_many :tags, :through => :taggings

  def taglist
    self.tags.map{ |x| x.name }.join(",")
  end

  def taglist=(list)
    tag_names = list.split(",")

    self.taggings.delete_all

    tag_names.each do |tag_name|
      tag = Tag.get(tag_name)

      self.taggings.build( :tag => tag )
    end

  end

end
