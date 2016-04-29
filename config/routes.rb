Rails.application.routes.draw do
  devise_for :users
  root 'twitter#index'

  post 'twitter/search', to: 'twitter#search', as: :search
end
