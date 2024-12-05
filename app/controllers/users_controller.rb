class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @posts = current_user.posts.last
    @records = current_user.records.all
    @user = User.find(current_user.id)
  end
end
