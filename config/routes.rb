Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  resources :users
  resources :link_pages, shallow: true do
    resources :links
  end
end
