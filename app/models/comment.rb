class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user
  validates :comment_body, presence: true, length: { minimum: 2, maximum: 200 }
end
