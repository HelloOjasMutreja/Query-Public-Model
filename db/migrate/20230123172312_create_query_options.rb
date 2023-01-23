class CreateQueryOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :query_options do |t|
      t.references :query, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
