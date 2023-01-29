class AddDailyDecisionListToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :daily_decision_list, default: 1, foreign_key: true
  end
end
