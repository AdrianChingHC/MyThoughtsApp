class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def require_admin
        unless current_user.admin == true 
          flash[:error] = "You must have the required access level to this section"
          redirect_to root_path # halts request cycle
        end
  end
end
