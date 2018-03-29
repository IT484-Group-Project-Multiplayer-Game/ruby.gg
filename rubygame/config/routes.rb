Rails.application.routes.draw do
  resources :users
  root :to => 'summoner#index'

  get 'auth/index'
  get 'auth/create'
  post 'auth/index'

  get 'summoner/index'
  get 'summoner/:ign' => 'summoner#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

end
