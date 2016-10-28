Rails.application.routes.draw do
  
  namespace :sale do
    namespace :note do
      resources :items
    end
  end
  root :to => 'home#index'

  namespace :data do
  get 'product/load'
  end

  namespace :data do
  get 'client/load'
  end

  resources :data
  
  namespace :sale do
    resources :flows
  end
  
  namespace :product do
    resources :brands
  end
  
  namespace :client do
    resources :reports
  end
  
  namespace :user do
    resources :reports
  end
  
  namespace :team do
    resources :reports
  end
  
  namespace :office do
    resources :reports
  end
  resources :roles
  resources :comunes
  resources :regions
  
  namespace :sale do
    resources :notes
  end
  
  resources :teams
  resources :offices
  resources :quotations
  resources :products
  resources :clients
  resources :users

  resources :post_sale_notes

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
