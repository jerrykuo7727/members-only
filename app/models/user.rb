class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :remember
  has_secure_password

  def remember
    @remember_token = SecureRandom.urlsafe_base64
    remember_digest = Digest::SHA1.hexdigest(@remember_token)
    self.remember_digest = remember_digest
  end

  def forget
    self.remember_digest = nil
  end
end
