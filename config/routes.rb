Rails.application.routes.draw do
  root "application#home"
  resources :users

  resource :session, only: [:create, :destroy, :new]
  #stores a cookie on users browser that can be passed back to rails app through a request
  #recognizes user for who user is. when logs in we have create session
  #when user logs out it is a destroy session
end
