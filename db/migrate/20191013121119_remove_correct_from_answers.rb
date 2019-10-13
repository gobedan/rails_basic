class RemoveCorrectFromAnswers < ActiveRecord::Migration[6.0]
  def change

    remove_column :answers, :correct, :boolean
    remove_column :questions, :correct, :boolean

  end
end
