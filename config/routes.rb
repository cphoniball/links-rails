Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "/profile", to: "pages#profile", as: :profile
  get "/link_page/:slug", to: "pages#link_page", as: :visit_link_page
  get "/link/:id/visit", to: "links#visit", as: :visit_link

  resources :link_pages, shallow: true do
    resources :links
  end

  scope "/admin" do
    resources :users
  end

  get "*path", to: "pages#not_found", constraints: lambda { |req|
    # Exclude active storage path from catch all
    req.path.exclude? "files"
  }
end
