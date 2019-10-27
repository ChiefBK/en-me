module Error
  module Responses
    class InvalidParamsError < ResponseError
      def initialize(message=nil)
        super(:unprocessable_entity, "invalid params", message)
      end
    end
  end
end