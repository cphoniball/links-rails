Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  # TODO: This overlaps with the devise registration routes, move this into a /admin nested resource
  resources :link_pages, shallow: true do
    resources :links
  end

  scope "/admin" do
    resources :users
  end

  get "*path", to: "pages#not_found"
end
