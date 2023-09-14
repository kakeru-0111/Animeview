class AddActorToAnime < ActiveRecord::Migration[6.1]
  def change
    add_column :animes, :actor, :string
  end
end
