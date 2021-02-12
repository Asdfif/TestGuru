Rails.application.routes.draw do

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'tests#index'
  
  devise_for :users, path: :gurus, 
                     path_names: { sign_in: :login, sign_out: :logout },
                     controllers: {sessions: 'sessions'}

  resources :tests, only: %i[index show] do
    resources :questions, shallow: true, only: :show do 
      resources :answers, shallow: true, only: :show
    end
    member do 
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do 
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
    resources :gists, only: :index do
    end
  end

end
