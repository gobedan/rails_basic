class RemoveUserIdChoiceAnswer < ActiveRecord::Migration[6.0]
  def change
    remove_column(:answers, :user_id, :integer)
    remove_column(:answers, :choice, :integer)
  end
end
