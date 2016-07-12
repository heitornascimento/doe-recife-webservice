DoeWs::Application.routes.draw do
  
  
  
  get "main/index"

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'main#index'

  #get "institutions/new"

  #get "institutions/create"

  #get "institutions/update"

  #get "institutions/edit"

  #get "institutions/destroy"

  #get "institutions/index"

  #get "institutions/show"
  
  resources :users, :only => [:new, :create, :update, :edit, :destroy, :index, :show]
  resources :institutions do
    collection do
      get 'institution_by_donation'
    end
  end
  
  resources :donations, :only => [:new, :create, :update, :edit, :destroy, :index, :show]
  
  
  #match '/institutions/institution_by_donation', :controller => 'institutions', :action => 'institution_by_donation'
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  ActiveAdmin.routes(self)

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  
  namespace :api do
    namespace :v1 do
      devise_scope :user do
         post 'registrations' => 'registrations#create', :as => 'register'
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end
       get 'tasks' => 'tasks#index', :as => 'tasks'
    end
  end
  
end
