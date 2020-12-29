class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :description

      t.timestamps
    end

  change_column_null(:questions, :description, false)

  end
end
