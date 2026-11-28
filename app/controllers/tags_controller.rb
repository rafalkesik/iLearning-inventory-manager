class TagsController < ApplicationController
  before_action :authenticate_user

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:success] = "Created tag: '#{@tag.title}'"
      redirect_to new_tag_path, status: :see_other
    else
      flash[:warning] = "Something went wrong"
      redirect_to new_tag_path, status: :see_other
    end
  end

  private

    def tag_params
      params.require(:tag).permit(:title)
    end
end