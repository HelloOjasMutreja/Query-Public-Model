class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.string :content
      t.references :query, null: false, foreign_key: true
      t.boolean :preferred

      t.timestamps
    end
  end
end
