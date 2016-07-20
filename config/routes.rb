Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  namespace :admin do
    resources :users

    root to: "admin#index"
  end

  resources :users do
    member do
      put :punch_clock, to: "timeclock#punch"
    end
  end

  root to: "users#show"
end
