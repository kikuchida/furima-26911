class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      @record_address.save
      redirect_to action: :index
    else
      render :index
    end
  end

  private

    def record_params
      params.require(:record_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
    end

end