Rails.application.routes.draw do
  resources :vents
  root 'vents#index'
end
