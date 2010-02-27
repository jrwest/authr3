Rails.application.routes.draw do |map|
  resources :accounts, :controller => 'authr/accounts', :only => [:new, :create]
  resource :session, :controller => 'authr/sessions', :only => [:new, :create, :destroy]
end
