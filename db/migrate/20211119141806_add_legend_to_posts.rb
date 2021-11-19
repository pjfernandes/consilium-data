class AddLegendToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :legend, :string
  end
end
