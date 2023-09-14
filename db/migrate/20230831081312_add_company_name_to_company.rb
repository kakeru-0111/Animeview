class AddCompanyNameToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :company_name, :string
  end
end
