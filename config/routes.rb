Rails.application.routes.draw do
  
  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}

  root 'time_cards#home'
  
  resources :time_cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
