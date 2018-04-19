Rails.application.routes.draw do
  resources :users
  root :to => 'summoner#index'
  
  get 'users/new'
  get 'users/show'

  get 'auth/index'
  get 'auth/create'
  post 'auth/index'

  get 'summoner/index'
  get 'summoner/search' => 'summoner#search'
  get 'summoner/:ign' => 'summoner#show', as: 'summoner_show'
  get 'summoner/favorites/index' => 'summoner#favoritesIndex', as: 'summoner_favorites_index'
  get 'summoner/favorites/:ign' => 'summoner#favoritesSave', as: 'summoner_favorites_save'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  
  get 'sessions/new'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#native_create'
  delete '/logout',  to: 'sessions#native_destroy'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

end