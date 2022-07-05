class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, confirmation: { case_sensitive: false }
  validates :password, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)
    cleanEmail = email.downcase.strip
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else
      nil
    end
  end
end
