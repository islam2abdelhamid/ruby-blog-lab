Rails.application.routes.draw do
  post 'comments/create'
  delete 'comments/destroy'

  resources :posts  
  root 'posts#index' 
end
