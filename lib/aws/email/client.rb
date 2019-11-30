module AWS
  module Email
    class Client
      def initialize
        @aws_client = Aws::SES::Client.new(
          credentials: Aws::Credentials.new(ENV['AWS_SES_ACCESS_KEY_ID'], ENV['AWS_SES_SECRET_ACCESS_KEY']),
          region: ENV['AWS_SES_REGION']
        )
      end

      def send_email(to_address, subject = 'test subject', html_body = 'test body')
        @aws_client.send_email({
          destination: {
            bcc_addresses: [],
            cc_addresses: [],
            to_addresses: [to_address]
          },
          message: {
            body: {
              html: {
                charset: 'UTF-8',
                data: html_body
              }
            },
            subject: {
              charset: 'UTF-8',
              data: subject
            }
          },
          source: 'iam@ianpierce.org'
        })
      end
    end
  end
end