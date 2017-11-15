Rails.application.routes.draw do
    root 'main#index'
  
    get 'login' => 'sessions#new'
  
    #posting to db
    post 'login' => 'sessions#create'

    post 'children/new'=>'children#create'
    post 'games/update' =>'games#update'
    delete 'logout' => 'sessions#destroy'
    
    get "signup" => 'users#new'
    post 'signup' => "users#create"
  
    resources :user
    resources :children
    resources :games
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
