class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true  
  validates :email, presence: true 
  validates :password, length: {minimum: 6}

  def self.authenticate_with_credentials (email,password)
    email = email.delete!(" ").downcase!
    user = User.where("lower(email) = ?", email).first
    if user.authenticate(password)
      return user
    else
      return nil 
    end
  end
end
