class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.string :category, null: false
      t.integer :level, default: 0
      t.references :user
      t.references :question

      t.timestamps
    end

  end
end
