class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :anime_name
      t.integer :overall

      t.timestamps
    end
  end
end
