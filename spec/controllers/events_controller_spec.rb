require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before do
    user = create(:user_with_email)
    create(:event, { name: 'lolla' })
    create(:event, { name: 'forest' })
    create(:event, { name: 'mamby' })

    set_request_jwt_cookie(user)
    set_matching_request_csrf
  end

  describe '#index' do
    let(:response) { get :index }
    let(:response_body) { JSON.parse(response.body) }

    it 'returns all events' do
      expect(response_body.length).to eq(3)
      expect(response_body[0]['name']).to eq('lolla')
      expect(response_body[1]['name']).to eq('forest')
      expect(response_body[2]['name']).to eq('mamby')
    end
  end
end
