class Relationship < ApplicationRecord

  belongs_to :user
  belongs_to :follow, class_name: 'User'

  validates :user_id, presence: true
  validates :follow_id, presence: true

  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow!(@user)
    
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
