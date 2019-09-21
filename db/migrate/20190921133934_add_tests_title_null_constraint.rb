class AddTestsTitleNullConstraint < ActiveRecord::Migration[6.0]
  #def change
  #end
  def up 
    change_column_null(:tests, :title, false)
  end

  def down
    change_column_null(:tests, :title, true)
  end
end
