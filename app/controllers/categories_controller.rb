class CategoriesController < ApplicationController
  before_action :authenticate_user

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "Created category: '#{@category.title}'"
      redirect_to new_category_path, status: :see_other
    else
      flash[:warning] = "Something went wrong"
      redirect_to new_category_path, status: :see_other
    end
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end
end