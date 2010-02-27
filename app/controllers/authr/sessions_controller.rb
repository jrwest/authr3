module Authr
  class SessionsController < ApplicationController
    def new
      @account = Account.new
    end
  end
end
