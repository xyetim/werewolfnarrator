Rails.application.routes.draw do
  get 'game' => "game#index"
  delete 'game' => "game#delete"

  root 'lobby#index'
end
