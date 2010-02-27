Rails.application.routes.draw do |map|
  resources :accounts, :controller => 'authr/accounts', :only => [:new, :create]
  resource :session, :only => [:new, :create, :destroy]
end
