Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Site root.
  root 'home#index'

  # Authentication.
  devise_for :users

  # Clients
  resources :client do
    get '/deactivate/', to: 'client#deactivate'
  end

end
