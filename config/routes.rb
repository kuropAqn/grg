Rails.application.routes.draw do

  namespace :admin do
    devise_for :admin, controllers: {
      sessions: 'admin/sessions'
    }

    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :games, only: [:index, :create, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :update, :edit, :create, :destroy]
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end

  scope module: :public do
    devise_for :users, controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions'
    }

    root 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'

    resources :games, only: [:index, :show] do
      resources :reviews, only: [:index, :show, :edit, :create, :destroy]
      resources :favorites, only: [:create, :destroy]
    end
  end
end