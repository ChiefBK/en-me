require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should validate_presence_of(:address_line_one) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip_code) }
  it { should validate_presence_of(:name) }
end
