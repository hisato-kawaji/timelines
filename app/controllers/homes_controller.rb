class HomesController < ApplicationController
  def index
    if user_signed_in? 
      @tweets = current_user.get_timelines
    else 
      @tweets = Tweet.all
    end
  end
end
