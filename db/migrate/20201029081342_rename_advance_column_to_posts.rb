class RenameAdvanceColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :advance, :other
    rename_column :posts, :body, :about
  end
end
