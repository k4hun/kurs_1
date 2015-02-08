class User < ActiveRecord::Base
  has_secure_password

  #EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2-4}\Z/i

  validates :firstname, :lastname,
            presence: true

  validates :user, 
            length: { in: 4..25 },
            uniqueness: true

  validates :email,
            uniqueness: true,
            presence: true,
            length: { maximum: 100 },
            format: { with: /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i },
            confirmation: true

  scope :sort, lambda{order('lastname ASC, firstname ASC')}

end
