class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index,  only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)  # 正しく保存できるならという記述
      redirect_to action: :show
    else
      render :edit # ダメならedit.htmlに戻るという設定する
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id,
                                 :delivery_schedule_id, :price).merge(user_id: current_user.id)
    # params.require(:モデル名)  # 取得したい情報を指定する
    # .permit(:キー名) # 取得したいキーを指定する←itemテーブルのカラム
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

end
