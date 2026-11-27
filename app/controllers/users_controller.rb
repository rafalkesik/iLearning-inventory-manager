class UsersController < ApplicationController
  before_action :verify_users_selected, only: [:bulk_destroy, :bulk_promote, :bulk_downgrade]

  def index
    @users = User.all.order(:created_at).paginate(page: params[:page])
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

  def bulk_promote
    User.where(id: params[:user_ids]).update_all(admin: :true)

    flash[:success] = "Users successfully promoted to admin role"
    redirect_to users_path, status: :see_other
  end

  def bulk_downgrade
    User.where(id: params[:user_ids]).update_all(admin: :false)

    flash[:success] = "Users successfully stripped of admin role"
    redirect_to users_path, status: :see_other
  end

  private

    def verify_users_selected
      return if params[:user_ids].present?

      redirect_to users_path, alert: "No users selected", status: :see_other
    end
end