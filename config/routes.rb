Rails.application.routes.draw do

#######################################################################

  # Home
  root 'home#index'

  get "/",                   to: "home#index"
  get "/home/index",         to: "home#search"
  get "/home/login",         to: "home#login"
  post "/home/login",        to: "home#authenticate_user"
  get "/home/logout",        to: "home#logout", as: :log_out

  # Merchants - Create, view all,

  get "/merchants/",          to: "merchants#index",  as: :merchants_home
  get "/merchants/new",       to: "merchants#new",    as: :merchant_signup
  post "/merchants/create",   to: "merchants#create", as: :merchant_create
  get "/merchants/:id",       to: "merchants#show",   as: :merchant_show
  get "/merchants/:id/edit",  to: "merchants#edit",   as: :merchant_edit
  patch "/merchants/:id/update", to: "merchants#update", as: :merchant_update

#######################################################################
  post "/orders/checkout",       to: "orders#checkout", as: :checkout
  get "/orders",                to: "orders#index"
  # post "/orders",               to: "order_items#update_stock"
  # get 'orders/update'
  get  "/order_items/:id/edit", to: "order_items#edit",   as: :edit_order_items
  put  "/order_items/:id",      to: "order_items#update", as: :order_items

  delete "/order_items/:id",     to: "order_items#destroy", as: :delete_order_items

#######################################################################
  # Orders

  get  "/cart",                   to: "products#cart"
  post "/:id/cart",               to: "products#add_to_cart", as: :add_to_cart
  get  "/orders/:id/edit",        to: "orders#edit", as: :edit_order
  get "orders/update"
  post "/orders/:id",             to: "orders#show"#, as: :cart

  # Order Items

  post "/order_items/:id",            to: "order_items#create"
  post "/order_items",            to: "order_items#create"#, as: :order_items


  # Products - Create, view all

  get  "/products/:id/about", to: "products#about",           as: :product_show
  get  "/products/index",     to: "products#index",           as: :products_home
  post "/products/new",       to: "products#add_to_database", as: :product_create
  get  "/products/new",       to: "products#new",             as: :product_new
  get  "/products/:id/edit",      to: "products#edit",            as: :product_edit
  put  "/products/:id/",  to: "products#update",              as: :product_update
  get "/products/:id/delete", to: "products#delete",          as: :product_delete

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
