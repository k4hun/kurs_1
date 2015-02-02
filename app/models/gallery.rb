class Gallery < ActiveRecord::Base
  has_many :photos

  validates   :name, 
              :presence => true, 
              :length => {:maximum => 120, :message => "Name to long"}

  scope :visible, lambda { where(:visible => true)}
  scope :sort, lambda { order("galleries.position ASC")}
  scope :latest, lambda { order ("galleries.created_at DESC")}

end
