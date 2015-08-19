Greenarea::Application.routes.draw do

  namespace :admin do
    resources :employees

    resources :dashboards

    resources :paid_types
  end

  devise_for :users

  # You can have the root of your site routed with "root"
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users, only: :show
end
