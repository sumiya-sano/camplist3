class AddLastSignInIpToUsers < ActiveRecord::Migration[6.0]
  def change
  add_column :users, :last_sign_in_ip, :datetime
  end
end
