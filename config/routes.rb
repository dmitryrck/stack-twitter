Rails.application.routes.draw do
  devise_for :users

  root 'twitter#index'

  post 'api/search', to: 'api/search#by_username', as: :search
end
