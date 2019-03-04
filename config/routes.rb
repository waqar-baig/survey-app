Rails.application.routes.draw do
  # get 'survey/show'

  devise_for :merchants, controllers: { omniauth_callbacks: 'merchants/omniauth_callbacks' }
  # authenticated :mercahnt do
    root to: "feedback_forms#index"
  # end
  resources :merchants
  resources :feedbacks
  resources :feedback_forms do
    resources :questions do
      resources :question_answers
    end
  end
  resources :customers do
    member do
      get  :add_feedback_form
      post :send_feedback_form
    end
  end
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  get '/t/:id'=> 'survey#show', as: :tiny
  patch '/survey/:id'=> 'survey#update', as: :survey
  get '/completed'=> 'survey#completed', as: :completed

end
