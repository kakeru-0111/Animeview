Rails.application.routes.draw do
  

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
  get 'animes/popure' => 'animes#popure'
  
  resources :animes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  root 'animes#index'

  resources :companies do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  

  resources :actors do
    resources :likes, only: [:create, :destroy]
    resources :reviews, only: [:create]
  end
  

end
