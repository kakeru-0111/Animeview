class AddUserIdToAnimes < ActiveRecord::Migration[6.1]
  def change
    add_column :animes, :user_id, :integer
  end
end
