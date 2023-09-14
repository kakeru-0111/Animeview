class AddCompanyIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :company_id, :integer
  end
end
