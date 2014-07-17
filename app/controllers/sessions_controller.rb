class SessionsController < ApplicationController
  def new
  end

def create
  user = User.authenticate(params[:email], params[:password_hash])
  if user
    session[:user_id] = user.id
    redirect_to posts_path, :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  redirect_to posts_path, :notice => "Logged out!"
end

  def user_params
    params.require(:user).permit(:email_string, :password_hash)
  end

end
