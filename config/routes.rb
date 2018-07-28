Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do 
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'


  get 'about-me', to: 'pages#about' 
  get 'contact', to: 'pages#contact'
  resources :blogs do
    #create blogs resource and add a toggle_status method.s 
  	member do 
  		get :toggle_status
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home' 
end

 # Prefix Verb   URI Pattern                                                                              Controller#Action
 #         new_user_session GET    /login(.:format)                                                                         devise/sessions#new
 #             user_session POST   /login(.:format)                                                                         devise/sessions#create
 #     destroy_user_session DELETE /logout(.:format)                                                                        devise/sessions#destroy
 #        new_user_password GET    /password/new(.:format)                                                                  devise/passwords#new
 #       edit_user_password GET    /password/edit(.:format)                                                                 devise/passwords#edit
 #            user_password PATCH  /password(.:format)                                                                      devise/passwords#update
 #                          PUT    /password(.:format)                                                                      devise/passwords#update
 #                          POST   /password(.:format)                                                                      devise/passwords#create
 # cancel_user_registration GET    /cancel(.:format)                                                                        devise/registrations#cancel
 #    new_user_registration GET    /register(.:format)                                                                      devise/registrations#new
 #   edit_user_registration GET    /edit(.:format)                                                                          devise/registrations#edit
 #        user_registration PATCH  /                                                                                        devise/registrations#update
 #                          PUT    /                                                                                        devise/registrations#update
 #                          DELETE /                                                                                        devise/registrations#destroy
 #                          POST   /                                                                                        devise/registrations#create
 #          sort_portfolios PUT    /portfolios/sort(.:format)                                                               portfolios#sort
 #               portfolios GET    /portfolios(.:format)                                                                    portfolios#index
 #                          POST   /portfolios(.:format)                                                                    portfolios#create
 #            new_portfolio GET    /portfolios/new(.:format)                                                                portfolios#new
 #           edit_portfolio GET    /portfolios/:id/edit(.:format)                                                           portfolios#edit
 #                portfolio PATCH  /portfolios/:id(.:format)                                                                portfolios#update
 #                          PUT    /portfolios/:id(.:format)                                                                portfolios#update
 #                          DELETE /portfolios/:id(.:format)                                                                portfolios#destroy
 #           portfolio_show GET    /portfolio/:id(.:format)                                                                 portfolios#show
 #                 about_me GET    /about-me(.:format)                                                                      pages#about
 #                  contact GET    /contact(.:format)                                                                       pages#contact
 #       toggle_status_blog GET    /blogs/:id/toggle_status(.:format)                                                       blogs#toggle_status
 #                    blogs GET    /blogs(.:format)                                                                         blogs#index
 #                          POST   /blogs(.:format)                                                                         blogs#create
 #                 new_blog GET    /blogs/new(.:format)                                                                     blogs#new
 #                edit_blog GET    /blogs/:id/edit(.:format)                                                                blogs#edit
 #                     blog GET    /blogs/:id(.:format)                                                                     blogs#show
 #                          PATCH  /blogs/:id(.:format)                                                                     blogs#update
 #                          PUT    /blogs/:id(.:format)                                                                     blogs#update
 #                          DELETE /blogs/:id(.:format)                                                                     blogs#destroy
 #                     root GET    /                                                                                        pages#home