class AddRuleAndValueToBadge < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :rule, :string, null: false
    add_column :badges, :value, :integer, null: false
  end
end
