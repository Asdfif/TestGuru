class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :description
      t.boolean :correct
      t.integer :question_id

      t.timestamps
    end

  change_column_null(:answers, :description, false)  
  change_column_default(:answers, :correct, from: nil, to: false)
  change_column_null(:answers, :question_id, false)
  end
end
