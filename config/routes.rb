Rails.application.routes.draw do
  scope "(:locale)", locale: /en|es|ja/ do
    resources :vents
  end
  root 'vents#index'
end
