Rails.application.routes.draw do
  # gibber can't go to home page with this , don't need to fix it for today I think
  authenticated :gibber do
    root to: 'gibbers/inquiries#index', as: :authenticated_root
  end
  root to: 'pages#home'

  mount ActionCable.server => '/cable'


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
      patch :add_review
    end
    resources :messages, only:[:create]
    resources :payments, only: [:new, :create]
  end

  resources :notices do
    collection do
      post :mark_as_read
    end
  end

  # resources :orders, only: [:show, :create] do
  #   resources :payments, only: [:new, :create]
  # end
end
