Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  resources :surveys
  resources :account

  devise_for :users
  authenticated :user do
    root 'surveys#index', as: :authenticated_root
  end

  root 'welcome#index'

end
