class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :workpost
  validates :comments, presence: true, length: { maximum: 255 }
end
