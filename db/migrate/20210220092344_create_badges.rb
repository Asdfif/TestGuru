class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img_url, null: false
      t.string :rule_type, null: false
      t.integer :rule_value
      # t.integer :tests_ids, null: false, array: true, default: []
      # t.boolean :first_time, null: false, default: false
      # t.integer :categories, null: false, array: true, default: []
      # t.integer :level, null: false, array: true, default: []

      t.timestamps
    end
  end
end
