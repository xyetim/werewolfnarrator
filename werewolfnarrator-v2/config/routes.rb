Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :player_group do
    resources :player, only: [:create, :update]
  end

  root 'main#index'
end
