Rails.application.routes.draw do
  root 'images#index'
  #get '/contents_new', to:'contents#new'
  #post '/contents_create', to:'contents#create'
  #get 'contents_show', to:'content#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :images do
    member do
      get 'show_image'
    end
  end
end
