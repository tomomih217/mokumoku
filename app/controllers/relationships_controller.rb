class RelationshipsController < ApplicationController
  def index
    @users = current_user.followings
  end

  def create
    current_user.follow(params[:user_id])
  end

  def destroy
    current_user.unfolloew(params[:user_id])
  end
end
