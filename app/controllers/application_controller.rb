class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :authenticate
  helper_method :current_user
  

  def new

    case self.klass

    when "Post"
      @post=Post.new
    when "User"
      @user=User.new 
    end
    
  end

  def current_user

    @user ||= @user=User.where(id:session[:user_id]).first

  end  

  
  def authenticate
    unless (session[:user_id])
      if (params[:controller] != "sessions" && params[:controller] != "users")
        redirect_to sign_in_path
      end
    end
  end



end
