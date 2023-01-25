class AddSituationToQueries < ActiveRecord::Migration[7.0]
  def change
    add_column :queries, :situation, :text
  end
end
