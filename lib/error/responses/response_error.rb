module Error
  module Responses
    class ResponseError < StandardError
      attr_reader :status, :error, :message

      def initialize(_status=:internal_server_error, _error="an error", _message="something went wrong")
        @error = _error
        @status = _status
        @message = _message
      end
    end
  end
end