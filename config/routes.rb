Rails.application.routes.draw do
 
  root to: 'home#index'
  get '/menu' , to: 'home#menu'
  get '/menu/date/:meal_date/interval/:meal_interval' , to: 'home#menu'

  get '/checkin' , to: 'checkin#index'
  get '/checkin/add' , to: 'checkin#add'
  post '/checkin/add' , to: 'checkin#add'

  get '/checkin/view' , to: 'checkin#view'
  post '/checkin/view', to: 'checkin#view'
  get '/checkin/view/:meal_date' , to: 'checkin#show' , as: :checkin_view_pdf
  get '/checkin/search', to: 'checkin#search'

  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:create, :destroy]
  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in
  get '/users' , to: 'users#index' , as: :users_new
  get '/user_sessions' , to: 'user_sessions#index' , as: :user_sessions_new

end
