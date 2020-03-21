Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  # ユーザーの編集に必要なルーティングは:edit, :update
  # resources :users, only: [:edit, :update] do
    # 投稿されたメッセージの一覧表示 & メッセージの入力ができる:index
    # メッセージの保存を行う:create
    resources :tweets, only: [:index, :create]
  # end
end
