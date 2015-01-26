class Page < ActiveRecord::Base
  has_many :articles
  belongs_to :category

  scope :visible, lambda { where(:visible => true)}
  scope :sort, lambda { order("pages.position ASC")}
  scope :latest, lambda { order ("pages.created_at DESC")}
end
