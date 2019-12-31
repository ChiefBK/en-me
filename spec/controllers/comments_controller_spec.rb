require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @user = create(:user_with_phone)

    set_request_jwt_cookie(@user)
    set_matching_request_csrf
  end

  describe '#index' do
    before do
      @event1 = create(:event)
      @comment1_1 = create(:comment, { user: @user, event: @event1, text: 'the first comment' })
      @comment1_2 = create(:comment, { user: @user, event: @event1, text: 'the second comment' })

      @event2 = create(:event)
      @comment_2_1 = create(:comment, { user: @user, event: @event2, text: 'some comment' })
      @comment_2_2 = create(:comment, { user: @user, event: @event2, text: 'some comment that is different' })
    end

    let(:response) { get :index, params: params }
    let(:params) { {} }
    let(:response_body) { JSON.parse(response.body) }

    it 'returns all comments' do
      expect(response_body).to contain_number_of_data_records(4)
      expect(response_body).to have_record_with_attribute_and_value(0, 'text', 'the first comment')
      expect(response_body).to have_record_with_attribute_and_value(1, 'text', 'the second comment')
      expect(response_body).to have_record_with_attribute_and_value(2, 'text', 'some comment')
      expect(response_body).to have_record_with_attribute_and_value(3, 'text', 'some comment that is different')
    end

    context 'returns comments for specified event' do
      context 'event 1' do
        let(:params) { { event_id: @event1.id } }

        it 'returns comments' do
          expect(response_body).to contain_number_of_data_records(2)
          expect(response_body).to have_record_with_attribute_and_value(0, 'text', 'the first comment')
          expect(response_body).to have_record_with_attribute_and_value(1, 'text', 'the second comment')
        end
      end
    end
  end
end