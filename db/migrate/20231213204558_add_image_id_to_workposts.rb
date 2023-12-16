class AddImageIdToWorkposts < ActiveRecord::Migration[6.1]
  def change
    add_column :workposts, :image_id, :string
  end
end
