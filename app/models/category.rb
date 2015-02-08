class Category < ActiveRecord::Base
  has_many :pages

  validates :name,
            presence: true

  scope :visible, lambda { where(:visible => true)}
  scope :sort, lambda { order("categories.position ASC")}
  scope :latest, lambda { order ("categories.created_at DESC")}

end
