Rails.application.routes.draw do
  devise_for :views
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'recipes#index'
  resources :recipes do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
