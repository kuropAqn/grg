Rails.application.routes.draw do
  # /admin/sign_in でアクセス可能にする
  devise_for :admin, path: 'admin', controllers: {
    sessions: 'admin/sessions'
  }

  # admin側のルーティング
  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :games
    resources :reviews
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end

  # ユーザー側のルーティング
  scope module: :public do
    devise_for :users, controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions'
    }

    root 'homes#about'
    get 'homes/about' => 'homes#about', as: 'about'
    get 'users/mypage' => 'users#show', as: 'mypage'
    get 'users/information/edit' => 'users#edit', as: 'information'
    patch 'users/information' => 'users#update', as: 'information_update'
    get  'users/unsubscribe' => 'users#unsubscribe', as:'unsubscribe'
    patch 'users/withdraw' => 'users#withdraw', as:'withdraw'

    resources :users, only: [:edit, :update]

    resources :games, only: [:index, :show] do
      resources :reviews do
        resource :favorites, only: [:create, :destroy]
      end
    end
  end
end
