Rails.application.routes.draw do

  get 'carts/index'

  get 'carts/update'

  post 'searchs/search'

  get 'searchs/index'

  get 'stores/details/:id', to: 'stores#details', as: 'details'

  get 'customers/index'

  get 'contacts/index'

  get 'stores/index'

  get 'sessions/create'

  root to: 'pages#index'

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  post 'customers/change_info', to: 'customers#change_info'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
