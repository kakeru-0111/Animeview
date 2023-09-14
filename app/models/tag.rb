class Tag < ApplicationRecord
  validates :name, presence: true
  #Tagsテーブルから中間テーブルに対する関連付け
  has_many :anime_tag_relations, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
  has_many :animes, through: :anime_tag_relations, dependent: :destroy
end
