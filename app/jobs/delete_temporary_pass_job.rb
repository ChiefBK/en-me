class DeleteTemporaryPassJob < ApplicationJob
  queue_as :default

  def perform(temp_pass_id)
    TemporaryPassword.destroy(temp_pass_id)
  end
end