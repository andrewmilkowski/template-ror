ActionController::Routing::Routes.draw do |map|
  map.resource :account, :except => :destroy
  map.resources :password_resets, :only => [:new, :create, :edit, :update]
  map.resources :users, :collection => {:impersonate => :post}
  map.resource :user_session, :only => [:new, :create, :destroy]
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.logout 'logout', :controller => "user_sessions", :action => "destroy"

  map.register 'register', :controller => "accounts", :action => "new"
  map.root :controller => "pages", :action => "home"
  map.pages 'pages/:action', :controller => "pages"
end
#== Route Map
# Generated on 14 Sep 2010 23:45
#
# Could not find Test::Unit 2.0, ignoring
# ** Erubis 2.6.6
#                 admin_data_index        /admin_data                                        {:action=>"all_models", :controller=>"admin_data/main"}
# admin_data_migration_information        /admin_data/migration                              {:action=>"index", :controller=>"admin_data/migration"}
#                admin_data_jstest        /admin_data/jstest                                 {:action=>"jstest", :controller=>"admin_data/migration"}
#                  admin_data_feed        /admin_data/feed/:klasss                           {:format=>:rss, :action=>"index", :controller=>"admin_data/feed"}
#                admin_data_search        /admin_data/quick_search/:klass                    {:action=>"quick_search", :controller=>"admin_data/search"}
#        admin_data_advance_search        /admin_data/advance_search/:klass                  {:action=>"advance_search", :controller=>"admin_data/search"}
#  table_structure_admin_data_on_k GET    /admin_data/klass/:klass/table_structure(.:format) {:action=>"table_structure", :controller=>"admin_data/main"}
#            admin_data_on_k_index GET    /admin_data/klass/:klass(.:format)                 {:action=>"index", :controller=>"admin_data/main"}
#                                  POST   /admin_data/klass/:klass(.:format)                 {:action=>"create", :controller=>"admin_data/main"}
#              new_admin_data_on_k GET    /admin_data/klass/:klass/new(.:format)             {:action=>"new", :controller=>"admin_data/main"}
#             edit_admin_data_on_k GET    /admin_data/klass/:klass/:id/edit(.:format)        {:action=>"edit", :controller=>"admin_data/main"}
#              del_admin_data_on_k DELETE /admin_data/klass/:klass/:id/del(.:format)         {:action=>"del", :controller=>"admin_data/main"}
#                  admin_data_on_k GET    /admin_data/klass/:klass/:id(.:format)             {:action=>"show", :controller=>"admin_data/main"}
#                                  PUT    /admin_data/klass/:klass/:id(.:format)             {:action=>"update", :controller=>"admin_data/main"}
#                                  DELETE /admin_data/klass/:klass/:id(.:format)             {:action=>"destroy", :controller=>"admin_data/main"}
#                      new_account GET    /account/new(.:format)                             {:action=>"new", :controller=>"accounts"}
#                     edit_account GET    /account/edit(.:format)                            {:action=>"edit", :controller=>"accounts"}
#                          account GET    /account(.:format)                                 {:action=>"show", :controller=>"accounts"}
#                                  PUT    /account(.:format)                                 {:action=>"update", :controller=>"accounts"}
#                                  POST   /account(.:format)                                 {:action=>"create", :controller=>"accounts"}
#                  password_resets POST   /password_resets(.:format)                         {:action=>"create", :controller=>"password_resets"}
#               new_password_reset GET    /password_resets/new(.:format)                     {:action=>"new", :controller=>"password_resets"}
#              edit_password_reset GET    /password_resets/:id/edit(.:format)                {:action=>"edit", :controller=>"password_resets"}
#                   password_reset PUT    /password_resets/:id(.:format)                     {:action=>"update", :controller=>"password_resets"}
#                impersonate_users POST   /users/impersonate(.:format)                       {:action=>"impersonate", :controller=>"users"}
#                            users GET    /users(.:format)                                   {:action=>"index", :controller=>"users"}
#                                  POST   /users(.:format)                                   {:action=>"create", :controller=>"users"}
#                         new_user GET    /users/new(.:format)                               {:action=>"new", :controller=>"users"}
#                        edit_user GET    /users/:id/edit(.:format)                          {:action=>"edit", :controller=>"users"}
#                             user GET    /users/:id(.:format)                               {:action=>"show", :controller=>"users"}
#                                  PUT    /users/:id(.:format)                               {:action=>"update", :controller=>"users"}
#                                  DELETE /users/:id(.:format)                               {:action=>"destroy", :controller=>"users"}
#                 new_user_session GET    /user_session/new(.:format)                        {:action=>"new", :controller=>"user_sessions"}
#                     user_session DELETE /user_session(.:format)                            {:action=>"destroy", :controller=>"user_sessions"}
#                                  POST   /user_session(.:format)                            {:action=>"create", :controller=>"user_sessions"}
#                            login        /login                                             {:action=>"new", :controller=>"user_sessions"}
#                           logout        /logout                                            {:action=>"destroy", :controller=>"user_sessions"}
#                         register        /register                                          {:action=>"new", :controller=>"accounts"}
#                             root        /                                                  {:action=>"home", :controller=>"pages"}
#                            pages        /pages/:action                                     {:controller=>"pages"}
