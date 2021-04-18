Rails.application.routes.draw do
  #resources :users
  #resources :values
  
  get 'users/:name', to: 'users#by_name'
  get 'values/:date', to: 'values#by_date'
  # get 'by_date/:date', to: 'values#by_date'
  # get 'name', to: 'users#by_name'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
