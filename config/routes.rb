Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  constraints do
    namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
        resources :users do
          collection do
            post :friend
            put  :unfriend
            get  :friends_list
            get  :mutual_friends
            post  :subscribe_to_updates
            put  :block_updates
            get  :can_receive_updates
          end
        end
        resources :docs, only: [:index]
      end
    end
    get '/api_docs/friends_management_swagger' => 'api_docs#friends_management_swagger'
  end
end

