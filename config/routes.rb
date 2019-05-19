Rails.application.routes.draw do
  resources :recipes
  resources :stores
  resources :items do
    collection do
      get 'generate_flier'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'
end
