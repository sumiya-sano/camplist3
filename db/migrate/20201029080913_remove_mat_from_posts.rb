class RemoveMatFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :mat, :text
  end
end
