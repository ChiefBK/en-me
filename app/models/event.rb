class Event < ApplicationRecord
  belongs_to :location, optional: true
  has_many :invites, dependent: :destroy
  has_many :comments
  has_many :event_reminders
  has_many :items
  # todo - add host of event

  validates :name, presence: true, length: { minimum: 1, maximum: 30 }
end
