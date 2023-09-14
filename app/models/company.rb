class Company < ApplicationRecord
    has_many :companies, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_companies, through: :likes, source: :company
    has_many :comments, dependent: :destroy
    validates :name, presence: true 
    validates :profile, length: { maximum: 200 } 
    def already_liked?(company)
        self.likes.exists?(company_id: company.id)
    end
    mount_uploader :image, ImageUploader
end
