class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :text,  presence: true, length: { maximum: 10000 }
  belongs_to :user
  self.per_page = 5
end
