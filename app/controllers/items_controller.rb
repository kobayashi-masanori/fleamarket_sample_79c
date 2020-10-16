class ItemsController < ApplicationController
  def index
    @items = Item.all.where.not(trading_status:2)
    @item_images_top = ItemImage.all.includes(:item).group(:item_id)
  end
end
