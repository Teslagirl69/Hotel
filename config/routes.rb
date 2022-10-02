Rails.application.routes.draw do
  devise_for :admin, path: 'admin', controllers: {
            registrations: 'admin/registrations'
          }, :sign_out_via => [ :get ]
                  namespace :admin do
                    # root :to => 'pages#dashboard'
                    get 'dashboard', to: 'pages#dashboard'
                    get '/admin/dashboard', as: :authenticated_root
                    resources :rooms
                    # resources :pages
                  end
  unauthenticated :admin do
                namespace :admin do
                  root :to => 'session#new', as: :unauthenticated_root
              end
             end



#   resources :pages
#
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#
#   # Defines the root path route ("/")
#    root "pages#index"
#
#         devise_for :admin, path: 'admin', controllers: {
#           registrations: 'admin/registrations'
#         }, :sign_out_via => [ :get ]
#                devise_scope :admin do
#           authenticated :admin do
#             namespace :admin do
#               get 'dashboard', to: 'pages#dashboard'
#                get '/admin/dashboard', as: :authenticated_root
#               # get '/admin/sign_out' => 'devise/sessions#destroy'
#               resources :rooms
#               # resources :pages
#             end
#           end
#           unauthenticated :admin do
#             namespace :admin do
#               root :to => 'session#new', as: :unauthenticated_root
#           end
#          end
#   # authenticated :admin do
#   #   root to: 'devise/sessions#new', as: :admin_authenticated_root_path
#   # end
# end
end