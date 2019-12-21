require 'rails_helper'

RSpec.describe TemporaryPasswordController, type: :controller do
  describe '#create' do
    subject { post :create, params: params }
    let!(:user) { create(:user_with_email, { email: 'test@gmail.com' }) }

    context 'is given valid input' do
      context 'by using the email of an existing user' do
        let(:params) { { to_email: 'test@gmail.com' } }

        it 'and receives correct response code' do
          expect(subject.status).to eq(201)
        end
      end
    end

    context 'invalid input' do

    end
  end
end