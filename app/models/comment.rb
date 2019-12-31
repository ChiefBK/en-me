class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user, presence: true
  validates :event, presence: true
  validates :text, presence: true

  scope :with_event_id, ->(id) { return if id.blank?; joins(:event).where(events: { id: id }) }
end
