SchemeFinderApi::Application.routes.draw do
  apipie
  devise_for :users

  get '/pages/about', to: 'pages#about', as: :about

  scope module: 'backend' do
    resource  :dashboard
    resources :accounts
    resources :schemes do
      collection {
        get :unconfirmed
      }
    end

    resources :feedbacks do
      collection {
        get :unapproved
      }
      member {
        put :approve
      }
    end

    # csv import
    concern :importable do
      collection {
        get :import_form
        post :import
      }
    end

    namespace :import_via_csv, module: "import_via_csv", path: "import_via_csv" do
      resources :schemes, only: [] do
        concerns :importable
      end

      resources :objects, only: [:index, :show] do
        resources :import_errors, only: [:index]
      end
    end
    # END csv  import
  end

  namespace :api do
    namespace :v1 do
      scope defaults: { format: 'json' } do
        resources :schemes, only: [:index, :create, :show] do
          scope module: :schemes do
            resources :feedbacks, only: [:index, :create]
          end
        end
        resources :activities, only: [:index]
        resources :age_ranges, only: [:index]
        resources :company_sizes, only: [:index]
        resources :locations, only: [:index]
        resources :sectors, only: [:index]
        resources :audiences, only: [:index]
        resources :subjects, only: [:index]
      end
    end
  end

  root to: 'backend/dashboards#show'
end
