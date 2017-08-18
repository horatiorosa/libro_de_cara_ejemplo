class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
     if @user.save
        session[:user_id] = @user.id
       redirect_to welcome_path, notice: "New account created."
     else
        flash[:alert] = "There was a problem creating your account, please try again."
        redirect_to welcome_path
    end
  end
  
  def update 
    @user = User.find(params[:id])
    @user.update(user_params)
  flash[:notice] = "Your profile has been successfully updated."  
  redirect_to welcome_path
  end
    
  def destroy
    @user = User.find(params[:id])
    if  @user.destroy
        session[:user_id] = nil
        flash[:notice] = "Your profile has been deleted."
    else
        flash[:alert] = "There was a problem deleting your profile."
    end
    redirect_to welcome_path
end

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :uid, :provider, :oauth_token)
end
