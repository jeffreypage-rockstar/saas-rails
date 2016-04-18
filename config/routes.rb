Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  resources :surveys



  devise_for :users, controllers: { registrations: 'users/registrations' }
  authenticated :user do
    root 'surveys#index', as: :authenticated_root
  end

  root 'welcome#index'
  get '/settings', to: 'devise/registrations#edit', as: 'account_settings'
end
