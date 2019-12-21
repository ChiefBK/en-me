require 'rails_helper'

RSpec.describe TemporaryPassword, type: :model do

  describe '#email_temporary_password' do
    let(:user) { create(:user_with_email) }
    subject { described_class.create(user: user, password: '129393') }

    before do
      subject.email_temporary_password
    end

    it 'enqueues password' do
      expect { PasswordMailer.send_temp_pass(subject.user.email).deliver_later }.to have_enqueued_job.on_queue('mailers')
    end
  end
end