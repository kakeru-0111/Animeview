class AddCharacterToAnime < ActiveRecord::Migration[6.1]
  def change
    add_column :animes, :character, :string
  end
end
