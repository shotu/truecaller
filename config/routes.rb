Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      #Protected routes
      namespace :protected do
        get  "users"  => "users#search_users"
      end

      #Protected routes
      namespace :public do
        post  "signup"  => "user#sighnup"
      end

    end
  end
end
