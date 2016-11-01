Rails.application.routes.draw do

#------------------SESSION ROUTES------------------
    get '/sessions/new' => 'sessions#new'
    post '/sessions/create' => 'sessions#create'
    delete '/sessions' => 'sessions#destroy'

#-------------------USERS ROUTES-------------------
    root 'users#new'
    post '/users/create' => 'users#create'
    get '/users/:id' => 'users#show'
    get '/users/:id/edit'=> 'users#edit'
    post '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'

#-------------------SECRETS ROUTES-------------------
    get '/secrets' => 'secrets#index'
    post '/secrets' => 'secrets#create'
    delete '/secrets/:id' => 'secrets#destroy'

#--------------------LIKES ROUTES--------------------
    post '/likes' => 'likes#create'
    delete '/likes' => 'likes#destroy'
end
