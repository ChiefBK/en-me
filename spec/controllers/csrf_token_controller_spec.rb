require 'rails_helper'

RSpec.describe CsrfTokenController, type: :controller do
  describe '#index' do
    let(:response) { get :index }

    it 'sets csrf cookie' do
      expect(response.status).to eq(200)
      expect(cookies['CSRF-TOKEN']).not_to be_empty
    end
  end
end
