# -*- encoding : utf-8 -*-

Ccbonline::Application.routes.draw do


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  # devise_for :users, :controllers => { :sessions => 'users/sessions' }


  # root to: 'churches#index'
  # resources :churches do
  #   resources :goods do
  #     collection do
  #       get 'destroy_all'
  #       get 'edit_multiple'
  #       put 'edit_multiple'
  #     end
  #   end
  #   resources :invoices do
  #     collection do
  #       delete 'destroy_all'
  #     end
  #   end
  # end
  # resources :good_types
  # resources :groups
  # resources :places
  # resources :profiles
  # resources :users

  # API
  namespace :api,:defaults => { :format => 'json' } do
    # resources :churches do
    #   resources :goods
    #   resources :invoices
    # end

    get 'login' => 'login#show'
    post 'login' => 'login#create'
    delete 'login' => 'login#destroy'

    shallow do
      resources :churches, except: [:create, :destroy] do
        resources :properties, except: [:create, :destroy] do
          resources :documents do
            resources :attachments
            resources :requests
            resources :comments
          end
          resources :taxes, except: [:create, :destroy]
        end
        resources :users
      end
    end
    resources :attachments
    resources :comments
    resources :documents
    resources :requests
    resources :document_types, only: [:index,:show]
    resources :profiles, only: [:index,:show,:update]
    resources :properties, only: [:index]
    resources :skills, only: [:index,:show]
    resources :statuses, only: [:index,:show]
    resources :users


    get 'patrimony/project' => 'patrimony#project'
    get 'patrimony/cards' => 'patrimony#cards'
    get 'patrimony' => 'patrimony#import'

    match '/login', :controller => 'login', :action => 'create', :constraints => {:method => 'OPTIONS'}, via: "OPTIONS"
  end
  root 'index#index'

  get 'patrimonio' => 'patrimonio#index'
  get 'patrimonio/migracao' => 'patrimonio#migracao'


end
