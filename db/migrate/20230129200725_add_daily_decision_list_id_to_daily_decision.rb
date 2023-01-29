class AddDailyDecisionListIdToDailyDecision < ActiveRecord::Migration[7.0]
  def change
    add_column :daily_decisions, :daily_decision_list_id, :integer
  end
end
