class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new
  end

  def new
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      @record_address.save
      redirect_to action: :index
    else
      render action: new
    end
  end

  private
    def record_params
      params.require(:record_address).permit(:user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building, :tel, :record)
    end

end