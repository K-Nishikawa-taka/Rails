Rails.application.routes.draw do
  get 'todolists/new'
  #topにアクセスしたとき、homesコントローラーのtopアクションが呼び出される
  get 'top' => 'homes#top'
  #/todolistsにpostメソッドでクエストしたとき
  #todolistコントローラーのcreateアクションが呼リび出される
  post 'todolists' => 'todolists#create'
  #todolistsにアクセスしたとき、todolistsコントローラーのindexアクションが呼び出される
  get 'todolists' => 'todolists#index'
  #.../todolists/1や.../todolists/3 に該当する
  #'todolists#show'の設定を'todolist'として利用できる
  get 'todolists/:id' => 'todolists#show', as: 'todolist'
  #'todolists#edit'の設定を'edit_todolist'として利用できる
  get 'todolists/:id/edit' => 'todolists#edit', as: 'edit_todolist'
  #todolistsにpatchメソッドでアクセスしたとき'update_todolist'
  patch 'todolists/:id' => 'todolists#update', as: 'update_todolist'
  #todolistsにpatchメソッドでアクセスしたとき、'destroy_todolist'
  delete 'todolists/:id' => 'todolists#destroy', as: 'destroy_todolist'
end
