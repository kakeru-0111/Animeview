class Actor < ApplicationRecord
    has_many :actors, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_actors, through: :likes, source: :actor
    has_many :reviews, dependent: :destroy
    validates :name, presence: true 
    validates :profile, length: { maximum: 200 } 
    def already_liked?(actor)
        self.likes.exists?(actor_id: actor.id)
    end
    mount_uploader :image, ImageUploader
end
