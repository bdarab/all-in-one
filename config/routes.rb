Rails.application.routes.draw do

    root 'pages#index'
    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'

    get 'signup', to: 'users#new'
    post 'signup', to: 'users#create'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'logout', to: 'sessions#destroy'

    get 'chatroom', to: 'chatroom#index'
    post 'message', to: 'messages#create'

    mount ActionCable.server, at: '/cable'
    
    resources :users
end
