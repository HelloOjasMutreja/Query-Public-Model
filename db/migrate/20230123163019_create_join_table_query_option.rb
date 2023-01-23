class CreateJoinTableQueryOption < ActiveRecord::Migration[7.0]
  def change
    create_join_table :queries, :options do |t|
      # t.index [:query_id, :option_id]
      # t.index [:option_id, :query_id]
    end
  end
end
