class User < ApplicationRecord
  before_create :remember
  has_secure_password

  def remember
    new_token = SecureRandom.urlsafe_base64.to_s
    remember_token = Digest::SHA1.hexdigest(new_token)
    self.remember_token = remember_token
  end
end
