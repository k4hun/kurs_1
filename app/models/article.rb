class Article < ActiveRecord::Base
  belongs_to :page

  validates   :name, 
              :presence => true, 
              :length => {:maximum => 120, :message => "Name to long"}

  has_attached_file :photo, :styles => { :medium => "600x600>", :thumb => "200x200>" }                    
  validates_attachment_content_type :photo, 
                                    :content_type => /^image\/(png|gif|jpeg)/, 
                                    :message => "Wrong file type! Use PNG, JPEG or GIF."
  validates_attachment_size :photo,
                            :in => 0..850.kilobytes,
                            :message => "Image size too big. Max size: 850kB"                               

  scope :visible, lambda { where(:visible => true)}
  scope :sort, lambda { order("articles.position ASC")}
  scope :latest, lambda { order ("articles.created_at DESC")}
end
