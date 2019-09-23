class ChangeDefaultTestsLevel < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:tests, :level, from: nil, to: 1)
  end
  def up 
    change_column_null(:tests, :level,  false)
  end

  def down
    change_column_null(:tests, :level,  true)
  end
end
