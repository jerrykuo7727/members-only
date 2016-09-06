class User < ApplicationRecord
  attr_accessor :remember_token
  before_save   :downcase_email
  before_create :remember
  validates :name, presence:true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  vadlidates :password, presence:true, length { minimum 6 }
  has_many :posts

  def remember
    @remember_token = SecureRandom.urlsafe_base64
    remember_digest = Digest::SHA1.hexdigest(@remember_token)
    self.remember_digest = remember_digest
  end

  def forget
    self.remember_digest = nil
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
