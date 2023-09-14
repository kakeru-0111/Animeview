class AddUserIdToActors < ActiveRecord::Migration[6.1]
  def change
    add_column :actors, :user_id, :integer
  end
end
