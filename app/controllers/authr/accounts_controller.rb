module Authr
  class AccountsController < ApplicationController
    def create
      @account = Account.new(params[:account])
      if @account.save
        redirect_to '/'
      else
        render :action => :new
      end
    end
    
    def new
      @account = Account.new
    end
  end
end
