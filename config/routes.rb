Rails.application.routes.draw do

  get 'user/sign_in' => "user#sign_in"
  post 'user/logged_in' => "user#logged_in"
  post 'list/create' => "list#create"
  post 'list/destroy' => "list#destroy"
  post 'task/create' => "task#create"
  post 'task/complete' => "task#complete"
  post 'task/destroy' => "task#destroy"
  get 'profile' => "user#profile"
  get "/auth/:provider/callback" => "user#create_from_omniauth"
  get 'user/logout' => "user#logout"
  get 'list/search' => "list#search", as: 'search'
  post 'list/search' => "list#search_result"


  resources :user
  resources :list, only: [:index, :show, :update]


  root "user#index"
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
