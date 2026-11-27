class UsersController < ApplicationController
  before_action :verify_users_selected, only: [:bulk_destroy]

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def bulk_destroy
    User.where(id: params[:user_ids]).destroy_all

    flash[:success] = "Users destroyed successfully"
    redirect_to users_path, status: :see_other
  end

  private

    def verify_users_selected
      return if params[:user_ids].present?

      redirect_to users_path, alert: "No users selected", status: :see_other
    end
end