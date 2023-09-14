class Like < ApplicationRecord
  belongs_to :anime
  belongs_to :company
  belongs_to :actor
  belongs_to :user
  validates_uniqueness_of :anime_id, scope: :user_id
  def already_liked?(anime)
    self.likes.exists?(anime_id: anime.id)
  end
  def already_liked?(company)
    self.likes.exists?(company_id: company.id)
  end

  def already_liked?(actor)
    self.likes.exists?(actor_id: actor.id)
  end
end
