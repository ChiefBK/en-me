require 'rails_helper'

RSpec.describe SmsMessage, type: :model do
  it { should belong_to :phone }

  it { should validate_presence_of :text}
end
