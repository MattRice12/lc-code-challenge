Rails.application.routes.draw do
  scope "(:locale)", locale: /en|nl/ do
    resources :vents
    root 'vents#index'
  end
end
