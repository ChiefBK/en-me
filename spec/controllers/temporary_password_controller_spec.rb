require 'rails_helper'

RSpec.describe TemporaryPasswordController, type: :controller do
  describe '#create' do
    subject { post :create, params: params }
    let!(:user) { create(:user_with_email, { email: 'test@gmail.com' }) }

    context 'is given valid input' do
      context 'by using the email of an existing user' do
        let(:params) { { to_email: user.email } }

        it 'and receives correct response code' do
          expect(subject.status).to eq(201)
        end
      end
    end

    context 'is given invalid input' do
      context 'by using the email of an nonexistent user' do
        let(:params) { { to_email: 'blahblah@gmaill.com' } }

        it 'and receives correct response code' do
          expect(subject.status).to eq(404)
        end
      end
    end

    context 'invalid input' do

    end
  end
end