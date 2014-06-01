Kidzcanzimbabwe::Application.routes.draw do
  root 'pages#show', id: 1

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :patients do
    collection do
      get :csv
    end
  end

  resources :comments,            only:   [:create, :destroy]
  resources :pages,               except: :landing
  resources :users,               only:   [:show, :edit, :index]
  resources :resource_categories, except: :destroy

  resources :resources do
    member do
      patch 'add_tag'
      patch 'remove_tag'
    end
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      patch 'add_tag'
      patch 'remove_tag'
    end
  end

  namespace :api, constraints: { format: /json/ } do
    namespace :v1 do
      resources :resources
      post 'search/people'    => 'search#people'
      post 'search/resources' => 'search#resources'
    end
  end
end
