class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :animes, dependent: :destroy
  has_many :companies, dependent: :destroy
  has_many :actors, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_animes, through: :likes, source: :anime
  has_many :liked_companies, through: :likes, source: :company
  has_many :liked_animes, through: :likes, source: :actor
  has_many :comments, dependent: :destroy
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 
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
