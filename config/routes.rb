Rails.application.routes.draw do
  devise_for :users
  get 'blogs/index'
  get 'blogs/create', to: 'blogs#my_blogs', as: 'create'
  get 'blogs/edit';
  get 'blogs/update'
  get 'blogs/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  post '/signin', to: 'sessions#create', as: 'signin'
  get '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  get '/my_blogs', to: 'blogs#my_blogs', as: 'my_blogs'
  get '/all_blogs', to: 'blogs#all_blogs'

  get '/blogs/:id/edit', to: 'blogs#edit', as: 'edit_blog'

  get '/blogs/:id/destroy' , to: 'blogs#destroy', as: 'destroy_blog'

  resources :blogs do
    resources :blogs, only:[:new,:create]
    resources :comments, only: [:create]
    resources :sessions, only: [:new, :create, :show, :destroy]
  end 

  resources :my_blogs


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
