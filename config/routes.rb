Rails.application.routes.draw do

  get 'stories/:id', to: 'stories#show', as: 'story'
  get 'stories', to: 'stories#index'
  put 'stories/:id/upvote', to: 'stories#upvote', as: 'like_story'
  put 'stories/:id/downvote', to: 'stories#downvote', as: 'dislike_story'

  devise_for :users

  root 'stories#index'

end
