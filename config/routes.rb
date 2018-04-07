Rails.application.routes.draw do
  get 'lobby/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'lobby#index'
end
