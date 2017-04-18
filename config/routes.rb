Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :gibbers
  devise_for :users

  resources :inquiries, only:[:index, :show, :new, :create, :destroy] do
    resources :orders, only:[:index] do
      member do
        patch :pending
        patch :proposed
        patch :accepted
        patch :rejected
        patch :completed
      end
    end
    resources :messages, only:[:create]
  end
end
