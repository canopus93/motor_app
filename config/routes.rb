Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'

  get '/motors/:id/refill_fuel', to: 'motors#refill_fuel', as: :refill_motor
  post '/motors/:id/refill_fuel', to: 'motors#update_refill_fuel'

  get '/motors/:id/ride', to: 'motors#ride', as: :ride_motor
  post '/motors/:id/ride', to: 'motors#update_ride'

  get '/motors/:id/reset', to: 'motors#reset', as: :reset_motor
  post '/motors/:id/reset', to: 'motors#reset'

  resources :motors
  resources :people do
  	resources :garages, only: [:new, :create, :destroy]
  end
end
