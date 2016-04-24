Rails.application.routes.draw do

  get 'landing_pages/show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  resources :surveys do
    member do
      get 'create_success'
      get 'pause'
      get 'resume'
    end
  end

  resources :choices do
    member do
      get 'select'
    end
  end

  resources :landing_pages, only: [:show] do
    collection do
      get 'preview'
    end
  end

  resources :comments

  devise_for :users, controllers: { registrations: 'users/registrations' }
  authenticated :user do
    root 'surveys#index', as: :authenticated_root
  end

  root 'welcome#index'
  get '/settings', to: 'devise/registrations#edit', as: 'account_settings'
  get '/billing', to:'account#billing', as: 'account_billing'
  post '/landing_page/preview', to: 'landing_pages#preview', as: 'landing_page_preview'
end
