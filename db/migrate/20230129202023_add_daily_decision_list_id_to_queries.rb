class AddDailyDecisionListIdToQueries < ActiveRecord::Migration[7.0]
  def change
    add_column :queries, :daily_decision_list_id, :integer
  end
end
