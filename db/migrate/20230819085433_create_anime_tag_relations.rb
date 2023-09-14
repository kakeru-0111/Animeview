class CreateAnimeTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :anime_tag_relations do |t|
      t.references :anime, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
