class AddQuestionsBodyNullConstraint < ActiveRecord::Migration[6.0]
 #def change
 #end
 def up 
    change_column_null(:questions, :body, false)
  end

  def down
    change_column_null(:questions, :body, true)
  end
end
