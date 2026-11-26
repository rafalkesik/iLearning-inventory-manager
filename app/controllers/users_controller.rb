class UsersController < ApplicationController
  def index
    @users = User.all.paginate(page: params[:page])
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end
end