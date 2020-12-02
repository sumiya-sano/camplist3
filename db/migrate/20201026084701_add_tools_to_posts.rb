class AddToolsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :tent, :text
    add_column :posts, :mat, :text
    add_column :posts, :sleep, :text
    add_column :posts, :lantan, :text
    add_column :posts, :cook, :text
    add_column :posts, :advance, :text
    add_column :posts, :title, :string
    add_column :posts, :advice, :text
    add_column :posts, :number, :integer
    add_column :posts, :price, :string
    add_column :posts, :body, :text
  end
end
