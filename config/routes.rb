Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get ‘/auth/failure’ => redirect(‘/’)

  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#google'

  resources :categories
  resources :posts
  resources :users do
    resources :jobs, only: [:new, :create, :index]
  end

end
