# rails g controller コントローラ名 アクション名 で作成

Rails.application.routes.draw do
  get 'lists/new' #見せて！
  post 'lists' => 'lists#create' #保存して！
  # post :新規保存
  
  get '/top' => 'homes#top'
  # get 'URL' => 'コントローラ名#アクション名' :表示
  # URLと同じで良いなら、右辺の省略可
  resources :lists
end
