Rails.application.routes.draw do |map|
  match 'login' => 'authr/sessions#new', :as => 'login' 
  match 'account/new' => 'authr/account#new', :as => 'new_account'
end
