class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.string :category, null: false
      t.integer :level
      t.references :user
      t.references :question

      t.timestamps
    end

  change_column_default(:tests, :level, from: nil, to: 0)
  end
end
