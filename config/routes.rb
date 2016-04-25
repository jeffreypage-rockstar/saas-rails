Rails.application.routes.draw do

  # Routes that doesn't need user authentication
  get 'landing_pages/show'

  resources :choices do
    member do
      get 'select'
    end
  end

  resources :responses do
    collection do
      get 'create_success'
    end
  end

  # Customize devise controller for user registrations
  devise_for :users, controllers: { registrations: 'users/registrations' }

  authenticated :user do
    root 'surveys#index', as: :authenticated_root
  end

  # Routes that needs user authentication
  authenticate :user do
    resources :surveys do
      member do
        get 'create_success'
        get 'pause'
        get 'resume'
      end
    end

    resources :landing_pages, only: [:show] do
      collection do
        get 'preview'
      end
    end
  end

  root 'welcome#index'
  get '/settings', to: 'devise/registrations#edit', as: 'account_settings'
  get '/billing', to:'account#billing', as: 'account_billing'
  post '/landing_page/preview', to: 'landing_pages#preview', as: 'landing_page_preview'
end
