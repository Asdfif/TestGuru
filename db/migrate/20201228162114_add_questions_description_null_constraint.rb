class AddQuestionsDescriptionNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:questions, :description, false)
  end
end
