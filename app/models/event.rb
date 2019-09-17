class Event < ApplicationRecord
  belongs_to :location
  has_many :invites, dependent: :destroy
  has_many :comments
  has_many :event_reminders
  has_many :items
  # todo - add host of event

  validates :name, presence: true
end
