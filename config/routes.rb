Rails.application.routes.draw do
  resource :account, :controller => :users
  get "login", :to => "user_sessions#new", :as => :login
  post "authenticate", :to => "user_sessions#create", :as => :authenticate
  get "logout", :to => "user_sessions#destroy", :as => :logout
  
  resources :authentications
  match '/auth/:provider/callback' => 'authentications#create', via: [:get, :post]
  
  resources :photos do
    collection do
      get :untouched
      post :edit_multiple
      put :update_multiple
      get :upload
      get :scan
    end
  end
  
  get "/uploads/:type/:id/:basename.:extension", :controller => "photos", :action => "download"
  
  resources :albums do
    collection do
      get :untouched
    end
    resources :tags do
      resources :photos do
        collection do
          get :untouched
          get :upload
          get :edit_multiple
        end
      end
    end
    resources :photos do
      collection do
        get :untouched
        get :upload
        get :edit_multiple
      end
    end
  end
  resources :collections do
    resources :albums do
      resources :photos do
        collection do
          get :untouched
          get :upload
          get :edit_multiple
        end
      end
    end
  end
  
  resources :tags, :shallow => true do
    resources :photos
    resources :albums
  end

  resources :users, :controller => "admin/users"
  
  root :to => "collections#index"
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
end
