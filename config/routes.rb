Rails.application.routes.draw do

  # Session
  # resource :session, only: [new, create, destroy]
  get "signin" => "session#new", as: "signin"
  post "login" => "session#create", as: "login"
  delete "logout" => "session#destroy", as: "logout"

  # Registration
  get "register" => "register#new", as: "register"
  post "register" => "register#create", as: "new_registration"
    #resources :register, only: [:create, :new]

  # Projects
  resources :projects do
    # Todo Lists
    resources :todo_lists, only: [:create, :update, :destroy, :show] do
      resources :todos, only: [:create, :update, :destroy]
    end
  end

  # Users
  resources :users, only: [:edit, :update, :destroy]


end
