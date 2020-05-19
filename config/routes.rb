Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  get 'homes/index' => 'homes#index'
  get '/lessons/search',to: 'lessons#search',as:'search' 
  get '/lessons/searches',to: 'lessons#searches',as:'searches' 
  
  resources :lessons, only: [:new, :create, :index, :show] do
    resources :likes, only: [:create, :destroy]
  end

  get '/lessonhs/search',to: 'lessonhs#search',as:'searchh' 
  get '/lessonhs/searches',to: 'lessonhs#searches',as:'searchesh' 
  
  resources :lessonhs, only: [:new, :create, :index, :show] do
    resources :likehs, only: [:create, :destroy]
  end

  get '/lessonsyos/search',to: 'lessonsyos#search',as:'searchsyo' 
  get '/lessonsyos/searches',to: 'lessonsyos#searches',as:'searchessyo' 
  
  resources :lessonsyos, only: [:new, :create, :index, :show] do
    resources :likesyos, only: [:create, :destroy]
  end

  get '/lessonses/search',to: 'lessonses#search',as:'searchse' 
  get '/lessonses/searches',to: 'lessonses#searches',as:'searchesse' 
  
  resources :lessonses, only: [:new, :create, :index, :show] do
    resources :likeses, only: [:create, :destroy]
  end

  get '/lessonkes/search',to: 'lessonkes#search',as:'searchke' 
  get '/lessonkes/searches',to: 'lessonkes#searches',as:'searcheske' 
  
  resources :lessonkes, only: [:new, :create, :index, :show] do
    resources :likekes, only: [:create, :destroy]
  end

 
  get '/lessonkos/search',to: 'lessonkos#search',as:'searchko' 
  get '/lessonkos/searches',to: 'lessonkos#searches',as:'searchesko' 
  
  resources :lessonkos, only: [:new, :create, :index, :show] do
    resources :likekos, only: [:create, :destroy]
  end

  get '/lessonris/search',to: 'lessonris#search',as:'searchri' 
  get '/lessonris/searches',to: 'lessonris#searches',as:'searchesri' 
  
  resources :lessonris, only: [:new, :create, :index, :show] do
    resources :likeris, only: [:create, :destroy]
  end

  get '/lessonnos/search',to: 'lessonnos#search',as:'searchno' 
  get '/lessonnos/searches',to: 'lessonnos#searches',as:'searchesno' 
  
  resources :lessonnos, only: [:new, :create, :index, :show] do
    resources :likenos, only: [:create, :destroy]
  end

  get '/lessonsos/search',to: 'lessonsos#search',as:'searchso' 
  get '/lessonsos/searches',to: 'lessonsos#searches',as:'searchesso' 
  
  resources :lessonsos, only: [:new, :create, :index, :show] do
    resources :likesos, only: [:create, :destroy]
  end

  get '/lessonkyos/search',to: 'lessonkyos#search',as:'searchkyo' 
  get '/lessonkyos/searches',to: 'lessonkyos#searches',as:'searcheskyo' 
  
  resources :lessonkyos, only: [:new, :create, :index, :show] do
    resources :likekyos, only: [:create, :destroy]
  end
  get '/lessonbs/search',to: 'lessonbs#search',as:'searchb' 
  get '/lessonbs/searches',to: 'lessonbs#searches',as:'searchesb' 
  
  resources :lessonbs, only: [:new, :create, :index, :show] do
    resources :likebs, only: [:create, :destroy]
  end
 
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
