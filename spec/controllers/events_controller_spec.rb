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
      expect(response_body).to contain_number_of_data_records(3)
      expect(response_body).to have_record_with_attribute_and_value(0, 'name', 'lolla')
      expect(response_body).to have_record_with_attribute_and_value(1, 'name', 'forest')
      expect(response_body).to have_record_with_attribute_and_value(2, 'name', 'mamby')
    end
  end
end
