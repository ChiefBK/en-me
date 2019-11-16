class Phone < ApplicationRecord
  belongs_to :user
  has_many :sms_messages

  validates :user, presence: true
  validates :is_primary, presence: true
end
