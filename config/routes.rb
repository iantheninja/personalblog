Rails.application.routes.draw do
  #devise_for :admins
  resources :posts

  devise_for :admins do
    # get 'admins/exit', to: 'devise/sessions#destroy', as: :logout
  end
  root "posts#index"
end
