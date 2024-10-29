class UsersController < ApplicationController
  def show
    @posts = current_user.posts.last
    @records = current_user.records.all
    @user = User.find(current_user.id)
  end
end
