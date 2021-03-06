Greenarea::Application.routes.draw do

  namespace :admin do
    resources :employees
    resources :paid_types
    resources :categories
    resources :ledgers
    resources :expenses
    resources :companies
    resources :warehouses
    resources :vendors
    resources :items do
      member do
        post 'reset'
      end
    end

    resources :package_types
    resources :containers
    resources :devices
    resources :vehicles
    resources :vehicle_companies
    resources :rate_masters
    resources :item_rate_masters
    resources :grievances do
      collection do
        get :grievance_id
      end
    end
    resources :reasons

    resources :requisitions do
      collection do
        get :requisition_id
      end
      member do
        get :print
      end
    end
    resources :requisition_items

    resources :payment_vouchers do
      collection do
        get :payment_id
      end
      member do
        get :print
      end
    end

    resources :salaries do
      collection do
        get :paid_salary
      end
      member do
        get :print
      end
    end

    resources :dashboards

    resources :stock_inwards do
      collection do
        get :inward_id
      end
      member do
        get :print
      end
    end
    resources :stock_inward_items

    resources :stock_outwards do
      collection do
        get :outward_id
      end
    end
    resources :stock_outward_items

    resources :outstanding_payments do
      member do
        get :print
      end
      collection do
        get :outstanding_id
      end
    end

    resources :invoices

    resources :vehicle_loadings do
      collection do
        get :vehicle_loading_id
      end
      member do
        get :print
      end
    end

    resources :vehicle_unloadings do
      collection do
        get :vehicle_unloading_id
      end
      member do
        get :print
      end
    end

    resources :vehicle_unloading_items

    resources :vehicle_loading_items
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
