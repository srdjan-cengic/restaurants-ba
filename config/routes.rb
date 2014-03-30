Restaurants::Application.routes.draw do
  devise_for :users, :path => 'superadmin' , :path_names => { :users=>'superadmin', :sign_in => 'login' , :sign_up => 'register', :sign_out=>'logout', sessions:'sessions'}
  #devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'


  namespace :api do
    resources :restaurants, except: [:new, :edit], defaults: { format: 'json' }
    resources :users, except: [:new], defaults: {format:'json'}
    resources :coupon_reservations, except: [:new], defaults: {format: 'json'}
    resources :coupons, except: [:new], defaults: {format: 'json'}
    resources :votes, except: [:new], defaults: {format: 'json'}

  end

  devise_scope :user do
    post "/superadmin/register", to: "devise/registrations#create"
  end

  namespace :superadmin do
    resources :home, controller: 'superadmin'
  end




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
