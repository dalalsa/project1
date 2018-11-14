Rails.application.routes.draw do
  get "/animals/location", to: "animals#index"

  devise_for :users
  resources :users, only: [:show]
  resources :animals do
    resources :comments
  end

  get "/all_animals/:search", to: "animals#index"
  get "/new_animal/:search", to: "animals#new"
  root "pages#home"
  get "/search" => "pages#search", :as => "search_page"
  put "/animals/:id/adopted", to: "animals#adopted"
  put "/animals/:id/returned", to: "animals#returned"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
