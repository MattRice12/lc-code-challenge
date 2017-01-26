Rails.application.routes.draw do
  resources :vents
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'vents#index'
end
