Rails.application.routes.draw do
  get 'game' => "game#index"

  root 'lobby#index'
end
