Rails.application.routes.draw do


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html\
  resources :articles
  resources :searchs
  # get '/new_article', to: 'articles#new_article'

  # get 'searches/create', to: 'searches#create'
  # get 'searches/trends', to: 'searches#search_trends'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "articles#index"
end
