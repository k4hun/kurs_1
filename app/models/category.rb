class Category < ActiveRecord::Base
  has_many :pages

  scope :visible, lambda { where(:visible => true)}
  scope :sort, lambda { order("categories.position ASC")}
  scope :latest, lambda { order ("categories.created_at DESC")}

end
