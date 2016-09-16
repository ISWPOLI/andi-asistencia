Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Authentication.
  devise_for :users

  # Site root.
  root 'home#index'

end
