class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :favour
  default_scope -> { order(created_at: :asc) }
  validates :user_id, presence: true
  validates :content, presence: true
end
