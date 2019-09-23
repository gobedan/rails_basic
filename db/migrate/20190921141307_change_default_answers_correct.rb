class ChangeDefaultAnswersCorrect < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:answers, :correct, from: nil, to: false)
  end
  def up 
    change_column_null(:answers, :correct,  false)
  end

  def down
    change_column_null(:answers, :correct,  true)
  end
end
