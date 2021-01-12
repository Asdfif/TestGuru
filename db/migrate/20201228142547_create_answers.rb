class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :description, null: false
      t.boolean :correct, default: false
      t.references :question

      t.timestamps
    end
    # change_column_default(:answers, :correct, from: nil, to: false)

  end
end
