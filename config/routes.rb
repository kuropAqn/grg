Rails.application.routes.draw do

  namespace :admin do
    devise_for :admin, controllers: {
      sessions: 'admin/sessions'
    }

    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :games
    resources :reviews
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end

  scope module: :public do
    devise_for :users, controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions'
    }

    root 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
    get 'users/mypage' => 'users#show', as: 'mypage'
    get 'users/information/edit' => 'users#edit', as: 'information'
    patch 'users/information' => 'users#update', as: 'information_update'
    get  'users/unsubscribe' => 'users#unsubscribe', as:'unsubscribe' #確認画面へのパス
    patch 'users/withdraw' => 'users#withdraw', as:'withdraw' #退会処理用のアクションパス

    resources :users, only: [:edit, :update, :unsubscribe, :withdraw]
    resources :games, only: [:index, :show] do
      resources :reviews
      resources :favorites, only: [:create, :destroy]
    end
  end
end