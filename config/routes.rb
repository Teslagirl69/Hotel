Rails.application.routes.draw do

  resources :rooms

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "rooms#index"

        devise_for :admins, path: 'admins', controllers: {
          registrations: 'admins/registrations'
        }
               devise_scope :admin do
          authenticated :admin do
            namespace :admins do
              get 'admins/index', as: :authenticated_root
              get '/admins/sign_out' => 'devise/sessions#destroy'
            end
          end
         end

end
