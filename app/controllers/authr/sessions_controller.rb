module Authr
  class SessionsController < ApplicationController

    unloadable

    def create
      if account = Account.authenticate(params[:account][:uname], params[:account][:password])
        session[:account_id] = account.id
        session[:account_login_time] = Time.now
        redirect_to (session[:return_to]) ? session[:return_to] : '/'
      else
        redirect_to new_session_path
      end
    end
    
    def new
      @account = Account.new
    end

    def destroy
      session[:account_id] = nil
      session[:account_login_time] = nil
      redirect_to new_session_path
    end
  end
end
