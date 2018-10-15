Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'list'                      => 'file_manager#list'
      post 'upload'                   => 'file_manager#upload'
      post 'user/register'            => 'users#register'
      post 'user/sign_in'             => 'users#sign_in'
      delete 'user/sign_out'          => 'users#sign_out'

      # Question
      post 'question/create_question'            => 'questions#create_question'
      post 'question/create_answer'              => 'questions#create_answer'
    end
  end
end
