class AddImageurlToWorkposts < ActiveRecord::Migration[6.1]
  def change
    add_column :workposts, :imageurl, :string
  end
end
