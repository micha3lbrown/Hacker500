Rails.application.routes.draw do

  get 'stories/:id', to: 'stories#show', as: 'story'
  get 'stories', to: 'stories#index'

  devise_for :users

  root 'stories#index'

end
