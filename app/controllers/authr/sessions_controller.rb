module Authr
  class SessionsController < ApplicationController

    unloadable

    def create
      if account = Account.authenticate(params[:account][:uname], params[:account][:password])
        set_session_for(account)
        redirect_to (session[:return_to]) ? session[:return_to] : '/'
      else
        redirect_to new_session_path
      end
    end
    
    def new
      @account = Account.new
    end

    def destroy
      reset_session
      redirect_to new_session_path
    end
  end
end
