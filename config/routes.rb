Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end

  get '/tests/:test_id/questions/:id', to: 'questions#show'

  get '/tests/:test_id/questions/:id/delete', to: 'questions#destroy'

end
