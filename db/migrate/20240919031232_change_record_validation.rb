class ChangeRecordValidation < ActiveRecord::Migration[7.1]
  def change
    change_column_null :records, :content, false
  end
end
