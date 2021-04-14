Rails.application.routes.draw do
  resources :bets

  resources :sports, only: [:index] do 
    resources :games, shallow: true
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
