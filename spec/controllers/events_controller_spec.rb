require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before do
    user = create(:user_with_email)
    e1 = create(:event, { name: 'lolla' })
    e2 = create(:event, { name: 'forest' })
    e3 = create(:event, { name: 'mamby' })
    create(:comment, { user: user, event: e1 })
    create(:comment, { user: user, event: e2 })

    set_request_jwt_cookie(user)
    set_matching_request_csrf
  end

  describe '#index' do
    let(:response) { get :index }
    let(:response_body) { JSON.parse(response.body) }

    it 'returns all events' do
      expect(response_body).to contain_number_of_data_records(3)
      expect(response_body).to have_record_with_attribute_and_value(0, 'name', 'lolla')
      expect(response_body).to have_record_with_attribute_and_value(1, 'name', 'forest')
      expect(response_body).to have_record_with_attribute_and_value(2, 'name', 'mamby')
    end

    context 'includes comments' do
      let(:response) { get :index, params: { include: ['comments'] } }
      it 'returns all events with their comments' do
        expect(response_body['data'][0]).to have_number_of_relationships_with_type('comments', 1)
        expect(response_body['data'][1]).to have_number_of_relationships_with_type('comments', 1)
        expect(response_body['data'][2]).to have_number_of_relationships_with_type('comments', 0)
      end
    end
  end
end
