class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :remember
  has_secure_password

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest token
  end

  def remember
    remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
end
