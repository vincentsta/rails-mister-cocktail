Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cocktails#home'
  resources :cocktails do
    resources :doses, only: [ :create, :new, :destroy ]
  end
end
