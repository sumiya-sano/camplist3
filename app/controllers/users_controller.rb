class UsersController < ApplicationController

   def show
      @user = User.find(params[:id])
      @posts = @user.posts.page(params[:page]).per(12)
   end

   def follow
      @user = User.find(params[:user_id])
      current_user.follow(@user)
      redirect_to user_path(@user)
   end

   def unfollow
      @user = User.find(params[:user_id])
      current_user.stop_following(@user)
      redirect_to user_path(@user)
   end


   def follow_list
   @user = User.find(params[:user_id])
   end

   def follower_list
   @user = User.find(params[:user_id])
   end
end
