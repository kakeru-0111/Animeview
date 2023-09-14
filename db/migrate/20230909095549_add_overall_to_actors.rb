class AddOverallToActors < ActiveRecord::Migration[6.1]
  def change
    add_column :actors, :overall, :integer
  end
end
