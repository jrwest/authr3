class ActionController::Base
  def self.authenticate(options = {})
    raise Exception, "Authenticate cannot be called on ActionController::Base. Only it's subclasses" if self ==  ActionController::Base
    prepend_before_filter :authenticate_session, options
  end

  def self.skip_authentication!(options = {})
    skip_before_filter :authenticate_session, options
  end

  private

    def authenticate_session
      unless valid_session? || [new_session_path, session_path].include?(request.request_uri)
        session[:return_to] = request.request_uri
        redirect_to new_session_path 
      end
    end

    def valid_session?
      ((session[:account_id] && session[:account_id] > 0) && (session[:account_login_time] && session[:account_login_time] < Time.now))
    end

end
