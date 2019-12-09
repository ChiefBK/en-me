require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#create' do
    let(:response) { post :create, params: params }
    let(:user) { create(:user_with_email) }
    let!(:temp_pass) { create(:temporary_password, { user: user }) }

    context 'no params' do
      let(:params) { {} }
      it 'can not find user' do
        expect(response.status).to eq(404)
      end
    end

    context 'correct password provided' do
      context 'email provided' do
        let(:params) { { email: user.email, temporary_password: temp_pass.password } }

        it 'successfully authenticates' do
          expect(response.status).to eq(201)
          expect(cookies['JWT-TOKEN']).not_to be_empty
        end
      end

      context 'phone number provided' do
        let(:params) { { phone_number: user.phone_numbers[0], temporary_password: temp_pass.password } }
        let(:user) { create(:user_with_phone) }

        it 'successfully authenticates' do
          expect(response.status).to eq(201)
          expect(cookies['JWT-TOKEN']).not_to be_empty
        end
      end

      context 'user info not provided' do
        let(:params) { { temporary_password: temp_pass.password } }

        it 'can not find user' do
          expect(response.status).to eq(404)
        end
      end
    end

    context 'incorrect password provided' do
      context 'email provided' do
        let(:params) { { email: user.email, temporary_password: 'aaslasdjf' } }

        it 'unsuccessfully authenticates' do
          expect(response.status).to eq(401)
        end
      end

      context 'phone number provided' do
        let(:user) { create(:user_with_phone) }
        let(:params) { { phone_number: user.phone_numbers[0], temporary_password: 'aaslasdjf' } }

        it 'unsuccessfully authenticates' do
          expect(response.status).to eq(401)
        end
      end

      context 'user info not provided' do
        let(:params) { { temporary_password: temp_pass.password } }

        it 'can not find user' do
          expect(response.status).to eq(404)
        end
      end
    end

    context 'no password provided' do
      context 'email provided' do
        let(:params) { { email: user.email } }
        it 'unsuccessfully authenticates' do
          expect(response.status).to eq(401)
        end
      end

      context 'phone number provided' do
        let(:params) { { phone_number: user.phone_numbers[0] } }
        let(:user) { create(:user_with_phone) }
        it 'unsuccessfully authenticates' do
          expect(response.status).to eq(401)
        end
      end

      context 'user info not provided' do
        let(:params) { {} }
        it 'can not find user' do
          expect(response.status).to eq(404)
        end
      end
    end
  end
end
