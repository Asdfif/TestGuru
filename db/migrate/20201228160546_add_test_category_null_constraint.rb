class AddTestCategoryNullConstraint < ActiveRecord::Migration[6.1]
  def change
  	change_column_null(:tests, :category, false)  	
  end
end
