class AddCommentToWorkposts < ActiveRecord::Migration[6.1]
  def change
    add_column :workposts, :comment, :text
  end
end
