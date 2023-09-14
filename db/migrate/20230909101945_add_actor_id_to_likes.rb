class AddActorIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :actor_id, :integer
  end
end
