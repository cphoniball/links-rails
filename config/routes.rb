Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "/link_page/:slug", to: "pages#link_page"
  get "/link/:id/visit", to: "links#visit", as: :visit_link

  resources :link_pages, shallow: true do
    resources :links
  end

  scope "/admin" do
    resources :users
  end

  get "*path", to: "pages#not_found"
end
