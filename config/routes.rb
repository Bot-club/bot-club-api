Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'list'                      => 'file_manager#list'
      post 'upload'                   => 'file_manager#upload'
      post 'user/register'            => 'users#register'
      post 'user/sign_in'             => 'users#sign_in'
      destroy 'user/sign_in'          => 'users#sign_out'
    end
  end
end
