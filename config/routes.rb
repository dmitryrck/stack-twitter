Rails.application.routes.draw do
  root 'twitter#index'

  post 'twitter/search', to: 'twitter#search', as: :search
end
