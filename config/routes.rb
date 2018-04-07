Rails.application.routes.draw do
  get 'game' => "game#index"
  post "/" => "lobby#join"

  root 'lobby#index'
end
