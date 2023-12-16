class Message < ApplicationRecord
  belongs_to :workpost
  
  validates :content, presence: true, length: { maximum: 255 }
end
