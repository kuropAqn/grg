Rails.application.routes.draw do

  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :games, only: [:index, :create, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :update, :edit, :create, :destroy]
  end

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
    devise_for :users, controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions'
    }
  end

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
