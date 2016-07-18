Rails.application.routes.draw do

  get 'checkout/step1'

  post 'checkout/check_s1', to: 'checkout#check_s1', as: 'check_s1'

  get 'checkout/step2'

  post 'checkout/check_s2', to: 'checkout#check_s2', as: 'check_s2'

  get 'checkout/step3'

  post 'checkout/check_s3', to: 'checkout#check_s3', as: 'check_s3'

  get 'checkout/step4'

  post 'checkout/check_s4', to: 'checkout#check_s4', as: 'check_s4'

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
