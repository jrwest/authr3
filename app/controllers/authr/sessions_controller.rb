module Authr
  class SessionsController < ApplicationController
    def new
      @account = Account.new
    end

    def create
      if account = Account.authenticate(params[:account][:uname], params[:account][:password])
        session[:account_id] = account.id
        session[:account_login_time] = Time.now
        redirect_to '/'
      else
        @account = Account.new
        render :action => :new
      end
    end
  end
end
