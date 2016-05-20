Rails.application.routes.draw do
  
  devise_for :users
  resources :manages
  resources :manages do
    resources :pictures, :only => [:create, :destroy] # support #create and #destroy
  end
  
   root 'menucliente#home'
   
   
  resources :menucliente do
    member do
      get "pratos"
      get "pedidos"
      get "show"
      get "lista"
      post "lista"
      post "list"
      get "limplista"
      delete "del"=> "menucliente#destroy"
    end
    
    collection do
      get "home"
      get "cardapio"
      get "pratos"
      get "pedidos"
      get "show"
      get "lista"
      
    end
  end
  
  #  get "home" => "menucliente#home"
  #  get "cardapio" => "menucliente#cardapio"
  #  get "pratos" => "menucliente#pratos"
  #  get "pedidos" => "menucliente#pedidos"
  #  get "show" => "menucliente#show"
  #  get "lista" => "menucliente#lista"
   
  # get 'descricao/:id' => 'menucliente#desc_prato'
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
