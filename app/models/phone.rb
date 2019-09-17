class Phone < ApplicationRecord
  belongs_to :user
  has_many :sms_messages

  validates :user_id, presence: true
end
