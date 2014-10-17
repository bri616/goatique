Rails.application.routes.draw do



  get "/",                    to: "home#index"

#######################################################################

  # Home

  get "/",                   to: "home#index"
  get "/home/index",         to: "home#search"

  # Merchants - Create, view all,

  get "/merchants/",          to: "merchants#index"
  get "/merchants/new",       to: "merchants#new"
  post "/merchants/create",   to: "merchants#create"
  get "/merchants/:id",       to: "merchants#show"

#######################################################################

  get "/orders",                 to: "orders#index"
  # get 'orders/update'
  get  "/order_items/:id/edit", to: "order_items#edit",   as: :edit_order_items
  put  "/order_items/:id",      to: "order_items#update", as: :order_items

  delete "/order_items/:id",     to: "order_items#destroy", as: :delete_order_items

#######################################################################
  # Orders

  get  "/cart",               to: "products#cart"
  post "/:id/cart",           to: "products#add_to_cart"
  get  "/orders/:id/edit",    to: "orders#edit", as: :edit_order
  get "orders/update"

  # Products - Create, view all

  get  "/products/:id/about", to: "products#about"
  get  "/products/index",     to: "products#index"
  post "/products/new",       to: "products#add_to_database"
  get  "/products/new",       to: "products#new"

  # Categories - View

  get "/categories/",         to: "categories#index"
  get "/categories/:id",      to: "categories#show"

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
