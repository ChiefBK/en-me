require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#create' do
    let(:response) { post :create, params: params }

    context 'valid users' do
      context 'no display name' do
        let(:params) { { first_name: 'bill', last_name: 'frank', email: 'test@gmail.com' } }

        it 'creates user' do
          expect(response.status).to eq(201)
        end

        context 'uses phone number' do
          let(:params) { { first_name: 'bill', last_name: 'frank', phone_number: '1234567890' } }

          it 'creates user' do
            expect(response.status).to eq(201)
          end
        end
      end

      context 'has display name' do
        let(:params) { { first_name: 'bill', last_name: 'frank', email: 'test@gmail.com', display_name: 'ip man'} }
        it 'creates user' do
          expect(response.status).to eq(201)
        end
      end
    end

    context 'invalid users' do
      context 'no first name' do
        let(:params) { { last_name: 'frank', email: 'test@gmail.com', display_name: 'ip man'} }
        it 'returns error' do
          expect(response.status).to eq(422)
        end
      end

      context 'no last name' do
        let(:params) { { first_name: 'frank', email: 'test@gmail.com', display_name: 'ip man'} }
        it 'returns error' do
          expect(response.status).to eq(422)
        end
      end

      context 'no email or phone number' do
        let(:params) { { first_name: 'frank', display_name: 'ip man'} }
        it 'returns error' do
          expect(response.status).to eq(422)
        end
      end
    end
  end
end