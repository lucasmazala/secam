Rails.application.routes.draw do

  root "tickets#index"
  resources :users
  resources :tickets

  # We are using the users_controller for the cooperator and requester because we are using STI. 
  # This way we can use one controller for all subclass. 
  resources :cooperators, :controller => "users", :type => "Cooperator"
  resources :requesters, :controller => "users", :type => "Requester"
  #https://stackoverflow.com/questions/5246767/sti-one-controller?rq=3
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  
end
