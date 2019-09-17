class ChangeContextColumnNameInSmsMessage < ActiveRecord::Migration[5.2]
  def change
    rename_column :sms_messages, :context, :text
  end
end
