class CreateDailyDecisionLists < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_decision_lists do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
