Rails.application.routes.draw do
  get "borrowings/create"
  get "borrowings/return"
  get "books/index"
  get "books/show"
  get "books/new"
  get "books/create"
  get "books/edit"
  get "books/update"
  get "books/destroy"

  resources :books do
    member do
      get 'borrow'
      post 'return'
    end
  end
  resources :borrowings, only: [:index]
  
  get "up" => "rails/health#show", as: :rails_health_check
end
