class EventSerializer < ApplicationSerializer
  has_many :comments
  attributes :name, :description, :starts_at
end
