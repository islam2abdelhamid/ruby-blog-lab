Rails.application.routes.draw do
  root 'home#index'
  get '/posts', to: 'post#index'
  get '/posts/new', to: 'post#new'

end
