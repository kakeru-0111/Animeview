class CreateActors < ActiveRecord::Migration[6.1]
  def change
    create_table :actors do |t|
      t.string :actor
      t.string :anime_name
      t.string :character
      t.string :zimusho

      t.timestamps
    end
  end
end
