Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :competitions, only: [:index, :show]

  get '/competitions/:competition_id/registration', to: 'registrations#new'

  post '/competitions/:competition_id/registration', to: 'registrations#create'
end
