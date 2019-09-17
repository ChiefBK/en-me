require 'rails_helper'

RSpec.describe Phone, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:sms_messages) }

end
