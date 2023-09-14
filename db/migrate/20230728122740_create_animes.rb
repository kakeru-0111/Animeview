class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      t.string :anime_name
      t.string :genre
      t.string :company_name
      t.string :age
      t.string :username
      t.integer :overall
      

      t.timestamps
    end
  end
end
