class RelationshipsController < ApplicationController
  def index
    @users = current_user.followings
  end

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
  end

  def destroy
    @user = User.find(Relationship.find(params[:id]).followed_id)
    current_user.unfolloew(@user.id)
  end
end
