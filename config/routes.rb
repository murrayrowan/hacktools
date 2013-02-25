Hacktools::Application.routes.draw do

  #get "home/index"
  root :to => 'home#index'

  # redirect /events to /, so that we don't have duplication with homepage
  match '/events', :to => redirect("/")

  # routes to show hackers and hacks within the event context, 
  # rather than globally, which is currently disabled

  get 'events/:id/:event_name', to: 'events#show'

  get 'events/:id/:event_name/hacks', to: 'hacks#index'

  get 'events/:id/:event_name/hacks/:hack_id/:hack_name', to: 'hacks#show'

  get 'events/:id/:event_name/hackers', to: 'hackers#index'

  get 'events/:id/:event_name/hackers/:hacker_id/:hacker_name', to: 'hackers#show'

  get 'events/:id/:event_name/teams/', to: 'teams#index'

  get 'events/:id/:event_name/teams/:team_id/:team_name', to: 'teams#show'

  # tag routes

  get 'events/:id/:event_name/hackers/with/tag/:tag/', to: 'hackers#index', as: :hacker_tag

  get 'events/:id/:event_name/hacks/with/tag/:tag/', to: 'hacks#index', as: :hack_tag

  get 'events/:id/:event_name/events/with/tag/:tag/', to: 'home#index', as: :event_tag

  # static pages
  match '/about',   to: 'static_pages#about', :via => [:get]
  match '/contact', to: 'static_pages#contact', :via => [:get] 


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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
