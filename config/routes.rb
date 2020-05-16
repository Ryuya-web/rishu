Rails.application.routes.draw do
  root 'homes#top' 
  get 'homes/index' => 'homes#index'
  get '/lessons/search',to: 'lessons#search',as:'search' 
  get '/lessons/searches',to: 'lessons#searches',as:'searches' 
  devise_for :users
  resources :lessons, only: [:new, :create, :index, :show] do
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
