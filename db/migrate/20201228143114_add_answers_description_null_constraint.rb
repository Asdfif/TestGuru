class AddAnswersDescriptionNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :description, false)
  end
end
