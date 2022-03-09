class BagController < ApplicationController
  before_action :find_items, only: [:index, :quantity_item, :filter, :find_items]
  before_action :quantity, only: [:filter, :index]
  before_action :total_price, only: [:filter, :index]

  def index
  end

  def find_items(id = nil)
    if id.nil?
      @items = Item.all.order(:id)
    else
      @item = Item.find(id)
    end
  end

  def quantity
    @quantity = 0
    @items.each {|item| @quantity += item.quantity}
  end

  def total_price
    @cost = 0
    @items.each {|item| @cost += item.price.to_f.floor(2)}
  end

  def update_item
  end

  def delete_item
    find_items(params[:id])
    @item.destroy
    redirect_to :action => 'index'
  end

  def quantity_item
    find_items(params[:id])
    if params[:minus]
      @item.update_attribute(:quantity, @item.quantity - 1) if @item.quantity > 0
      @item.update_attribute(:price, (@item.quantity * @item.begin_price.to_f).floor(2)) if @item.quantity >= 0
    else
      @item.update_attribute(:quantity, @item.quantity + 1)
      @item.update_attribute(:price, (@item.quantity * @item.begin_price.to_f).floor(2))
    end
    total_price
    quantity
  end

  def load_items
    Load.transmit_and_check
    redirect_to :action => 'index'
  end

  def view_filter
  end

  def filter
    if params[:filter] == 'category'
      @filter = Item.order_category
    elsif params[:filter] == 'quantity'
      @filter = Item.order_quantity
    elsif params[:filter] == 'cost'
      @filter = Item.order_price
    end
    render :list_items, locals: {filter: params[:filter], items: @filter}
  end
end
