class AddOverallToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :overall, :integer
  end
end
