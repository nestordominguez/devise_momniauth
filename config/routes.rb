DeviseMomniauth::Application.routes.draw do
  
  get "welcome/index"
  #resources :users

  get   '/login', :to => 'sessions#new', :as => :login
  match '/auth/:provider/callback', :to => 'sessions#create', via: 'get'
  match '/auth/failure', :to => 'sessions#failure', via: 'get'
  
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks",
                                      :registrations => "users/registrations",
                                      registrations: 'registrations' } 
  #devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks" }   

           # path: "auth", 
           #  path_names: { sign_in: 'login', sign_out: 'logout', 
           #  password: 'secret', confirmation: 'verification', 
           #  unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' },
          #http://localhost:3000/auth/auth/google_oauth2/
          # http://localhost:3000/users/auth/google_oauth2/callback  <-- original

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # devise_scope :user do
  #   get "sign_in", to: "devise/sessions#new"
  #   root "devise/sessions#new"
  # end

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
