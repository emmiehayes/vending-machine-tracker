class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @machines = Machine.all
  end
end
