class Workpost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  has_many :comments
  has_many :sends
end
