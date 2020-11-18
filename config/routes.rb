Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update] do
    get "all"
  end
  resources :games do
    resources :boards, only: [:new, :create, :show, :update]
    resources :dices, only: [:new, :create, :show, :update]
    resources :card_decks, only: [:new, :create, :show, :update] do
      resources :cards, only: [:new, :create, :show, :update]
    end
    resources :pieces, only: [:new, :create, :show, :update]
    resources :tokens, only: [:new, :create, :show, :update]
    get "preview"
  end
  resources :gamerooms, only: [:new, :create, :show, :update] do
    resources :messages, only: :create
  end
end
