require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:location) }

  it { should have_many(:invites) }
  it { should have_many(:comments) }
  it { should have_many(:event_reminders) }
  it { should have_many(:items) }

  it { should validate_presence_of(:name) }
end
