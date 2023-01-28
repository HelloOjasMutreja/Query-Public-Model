class CreateDailyDecisions < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_decisions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :query, null: false, foreign_key: true

      t.timestamps
    end
  end
end
