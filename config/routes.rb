Rails.application.routes.draw do
  root to: 'top#index'

  # For OmniAuth
  get '/auth/:provider/callback', to: 'sessions#callback'
  get '/auth/failure',            to: 'sessions#failure'
  get '/logout',                  to: 'sessions#destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :followings do
    collection do
      get 'refresh'
    end
  end
end

# == Route Map
#
# W, [2017-02-06T13:36:47.761078 #49689]  WARN -- : You are setting a key that conflicts with a built-in method OmniAuth::AuthHash::InfoHash#name defined at /Users/motchang/src/github.com/motchang/manage_following/vendor/bundle/gems/omniauth-1.3.2/lib/omniauth/auth_hash.rb:34. This can cause unexpected behavior when accessing the key via as a property. You can still access the key via the #[] method.
#             Prefix Verb   URI Pattern                        Controller#Action
#               root GET    /                                  top#index
#                    GET    /auth/:provider/callback(.:format) sessions#callback
#       auth_failure GET    /auth/failure(.:format)            sessions#failure
#             logout GET    /logout(.:format)                  sessions#destroy
# refresh_followings GET    /followings/refresh(.:format)      followings#refresh
#         followings GET    /followings(.:format)              followings#index
#                    POST   /followings(.:format)              followings#create
#      new_following GET    /followings/new(.:format)          followings#new
#     edit_following GET    /followings/:id/edit(.:format)     followings#edit
#          following GET    /followings/:id(.:format)          followings#show
#                    PATCH  /followings/:id(.:format)          followings#update
#                    PUT    /followings/:id(.:format)          followings#update
#                    DELETE /followings/:id(.:format)          followings#destroy
#
