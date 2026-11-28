class InventoriesController < ApplicationController
  before_action :authenticate, only: %i[new]

  def index
  end

  def new
    @inventory = Inventory.new
  end
end