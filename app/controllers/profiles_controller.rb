class ProfilesController < ApplicationController
  def show
    begin 
      @user = User.find params[:id]
    rescue ActiveRecord::RecordNotFound 
      raise 'error'
    end
    @tweets = @user.tweets
    @followers = @user.follower_users 
  end

end
