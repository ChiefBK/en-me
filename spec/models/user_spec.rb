require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:invites).dependent(:destroy)}
  it { should have_many(:comments).dependent(:destroy)}
  it { should have_many(:event_reminders).dependent(:destroy)}
  it { should have_many(:items).dependent(:destroy)}
  it { should have_many(:phones).dependent(:destroy)}

  it { should validate_presence_of(:display_name) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
end
