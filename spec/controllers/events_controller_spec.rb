require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }

  before do
    create_jwt_cookie(user)
  end

  describe '#index' do
    let(:event1) { create(:event) }
    let(:event2) { create(:event) }
    let(:event3) { create(:event) }

    it 'returns all events' do
      binding.pry
      get :index

      expect(response).to have_record(event1)
      expect(response).to have_record(event2)
      expect(response).to have_record(event3)
    end
  end
end
