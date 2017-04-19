Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :gibbers
  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :gibbers do
    resources :inquiries, only:[:index] do
      member do
        patch :pending
        patch :propose
        patch :complete
        patch :assign_gibber
      end
    end
  end

  resources :inquiries, only:[:index, :show, :new, :create, :destroy] do
    member do
      patch :pending
      patch :accept
      patch :reject
    end
    resources :messages, only:[:create]
  end
end
