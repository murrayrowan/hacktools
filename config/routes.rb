Hacktools::Application.routes.draw do

  resources :affiliations
  resources :attendances
  resources :authentications
  match '/auth/:provider/callback' => 'authentications#create'

  devise_for :users, :controllers => {:registrations => 'registrations'}

  #get "home/index"
  root :to => 'home#index'

  # redirect /events to /, so that we don't have duplication with homepage
  match '/events', :to => redirect("/")

  get '/users/:user_id/:user_name/events', to: 'attendances#index', as: :user_attendances

 # EVENTS
 # EVENTS INDEX IS HOMEPAGE

  #get 'events/:id/:event_name', to: 'events#show', as: :event
  match "events/:id/:event_name" => redirect("/events/%{id}/%{event_name}/hackers"), as: :event

  get 'events/new', to: 'events#new', as: :new_event

  match 'events/create', to: 'events#create', as: :create_event

  get 'events/:id/:event_name/edit', to: 'events#edit', as: :edit_event

  put 'events/:id/:event_name', to: 'events#update', as: :update_event

# HACKS

  get 'events/:id/:event_name/hacks', to: 'hacks#index', as: :hacks

  get 'events/:id/:event_name/hacks/:hack_id/:hack_name', to: 'hacks#show', as: :hack

  get 'events/:id/:event_name/new_hack', to: 'hacks#new', as: :new_hack

  post 'events/:id/:event_name/hack/create', to: 'hacks#create', as: :create_hack

# HACKERS

  get 'events/:id/:event_name/hackers', to: 'hackers#index', as: :hackers

  get 'events/:id/:event_name/hackers/:hacker_id/:hacker_name', to: 'hackers#show', as: :hacker

  #this was deprecated by /users/edit
  #get 'events/:id/:event_name/hackers/:hacker_id/:hacker_name/edit', to: 'hackers#edit', as: :edit_hacker

  get 'hackers/edit', to: 'hackers#edit', as: :edit_hacker_profile

  put 'hackers/update', to: 'hackers#update', as: :update_hacker_profile

  get 'hackers/show', to: 'hackers#show', as: :hacker_profile

  put 'events/:id/:event_name/hackers/:hacker_id/:hacker_name/update', to: 'hackers#update', as: :update_hacker

  get 'events/:id/:event_name/hackers/new', to: 'hackers#new', as: :new_hacker

  post 'events/:id/:event_name/hackers/create', to: 'hackers#create', as: :create_hacker

# TEAMS

  get 'events/:id/:event_name/teams/', to: 'teams#index', as: :teams

  get 'events/:id/:event_name/teams/:team_id/:team_name', to: 'teams#show', as: :team

  get 'events/:id/:event_name/teams/:team_id/:team_name/:tab_value', to: 'teams#show', as: :team_tabset

  get 'events/:id/:event_name/new_team', to: 'teams#new', as: :new_team

  post 'events/:id/:event_name/team/create', to: 'teams#create', as: :create_team

  # tag routes

  get 'events/:id/:event_name/hackers/with/tag/:tag/', to: 'hackers#index', as: :hacker_tag

  get 'events/:id/:event_name/hacks/with/tag/:tag/', to: 'hacks#index', as: :hack_tag

  get 'events/:id/:event_name/events/with/tag/:tag/', to: 'home#index', as: :event_tag

  # static pages
  match '/about',   to: 'static_pages#about', :via => [:get], as: :about
  match '/contact', to: 'static_pages#contact', :via => [:get], as: :contact 

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
