class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :description, null: false
      t.references :answer, foreign_key: true, null: false

      t.timestamps
    end

  end
end
