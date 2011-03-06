class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  helper_method :current_user, :current_user_session
  before_filter :set_current_user
  filter_parameter_logging :password
  
  protected
    def set_current_user
      Authorization.current_user = current_user 
    end
 
  private 
    def current_user_session
      return @current_user_session ||= UserSession.find
    end
  
    def current_user
      return @current_user ||= current_user_session && current_user_session.record
    end
  
end
