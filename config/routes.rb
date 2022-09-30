Rails.application.routes.draw do

  resources :pages

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "pages#index"

        devise_for :admin, path: 'admin', controllers: {
          registrations: 'admin/registrations'
        }
               devise_scope :admin do
          authenticated :admin do
            namespace :admin do
              get 'admin/index', as: :authenticated_root
              get '/admin/sign_out' => 'devise/sessions#destroy'
              resources :rooms
            end
          end
         end

end
