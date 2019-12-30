class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user, presence: true
  validates :event, presence: true
  validates :text, presence: true
end
