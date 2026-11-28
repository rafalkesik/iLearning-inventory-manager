class InventoriesController < ApplicationController
  before_action :authenticate_user, only: %i[new]

  def index
    @inventories = Inventory.all
  end

  def new
    @inventory = Inventory.new
  end

  def show
    @tabs = ['Items', 'Chat ∅', 'Settings ∅', 'Custom ID ∅', 'Fields ∅', 'Access ∅', 'Stats ∅', 'Export ∅']
    @inventory = Inventory.find(params[:id])
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.author = current_user

    if @inventory.save
      flash[:success] = "Successfully created a new inventory"
      redirect_to inventories_path, status: :see_other
    else
      flash[:warning] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  private

    def inventory_params
      permitted = params.require(:inventory).permit(:title, :description, :visibility, :category)
      permitted.compact_blank
    end
end