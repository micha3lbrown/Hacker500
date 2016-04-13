Rails.application.routes.draw do

  devise_for :users

  resources :stories, only: [:index, :show] do
    member do
      put 'like', to: 'stories#upvote'
      put 'dislike', to: 'stories#downvote'
    end
  end

  resources :users do
    resources :comments
  end

  resources :comments

  root 'stories#index'

end
