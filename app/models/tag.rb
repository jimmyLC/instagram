class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :photos, :through => :taggings

  def self.get(name)
    name = name.strip
    find_by_name(name) || create(:name => name)
  end

end