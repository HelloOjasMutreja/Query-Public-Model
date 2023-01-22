class AddUserIdToQueries < ActiveRecord::Migration[7.0]
  def change
    add_column :queries, :user_id, :integer
  end
end
