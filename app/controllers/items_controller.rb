class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :product, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_schedule_id, :price).merge(user_id: current_user.id)
# params.require(:モデル名)  # 取得したい情報を指定する
# .permit(:キー名, :キー名) # 取得したいキーを指定する←itemテーブルのカラム
  end

end