Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :orders, only: [:index, :new, :create]
  end
end

# 元の記述（ネスト前）
# Rails.application.routes.draw do
#   get 'orders/index'
#   devise_for :users
#   root 'items#index'
#   resources :items
# end
