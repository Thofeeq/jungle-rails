class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true  
  validates :email, presence: true 
  validates :password, length: {minimum: 6}
end
