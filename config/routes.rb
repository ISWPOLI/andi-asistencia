Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Site root.
  root 'home#index'

  # Authentication.
  devise_for :users

  # Clients
  resources :client do
    get '/deactivate', to: 'client#deactivate'
  end

  # Importations.
  scope '/importation' do
    get '/sales', to: 'importation#sales'
    post '/sales', to: 'importation#import_sales_xls'

    get '/payments', to: 'importation#payments'
    post '/payments', to: 'importation#import_payments_xls'
  end

end
