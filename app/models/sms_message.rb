class SmsMessage < ApplicationRecord
  belongs_to :phone

  validates :phone_id, presence: true
  validates :text, presence: true
end
