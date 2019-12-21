require "rails_helper"

RSpec.describe PasswordMailer, type: :mailer do
  describe '#send_temp_pass' do
    let(:mailer) { described_class.new }
    subject { described_class.send_temp_pass('test@gmail.com', '293324') }

    it 'email subject correct' do
      expect(subject.subject).to eq('Your Temporary Password')
    end

    it 'contains correct password' do
      expect(subject.body.encoded).to match(/293324/)
    end
  end
end
