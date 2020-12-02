class AddDetailsToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :post_id, :bigint
  end
end
