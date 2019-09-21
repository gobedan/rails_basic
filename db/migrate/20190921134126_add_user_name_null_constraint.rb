class AddUserNameNullConstraint < ActiveRecord::Migration[6.0]
 #def change
 #end
 def up 
    change_column_null(:users, :name, false)
  end

  def down
    change_column_null(:users, :name, true)
  end
end
