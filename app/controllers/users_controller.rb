class UsersController < ApplicationController
before_filter :save_login_state, :only => [:new, :create]
before_filter :check_auth, :only => [:edit, :update, :destroy]


def check_auth

  @user = User.find(params[:id])
  if @current_user.id != @user.id
      flash[:notice] = "Sorry, you can't edit this"
     
  end
end

def index

	@users = User.all

  respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
  end
end

def new
	@user = User.new
end


def create
  
  @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to @user
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render 'new'
  end
end

def show

  @user = User.find(params[:id])
end



def edit
  
  @user = User.find(params[:id])

end

def update
  @user = User.find(params[:id])
 
  if @user.update_attributes(params[:user])
    redirect_to @user
  else
    render 'edit'
  end
end

def destroy
  
  @user = User.find(params[:id])
  @user.destroy
 
  redirect_to users_path
end
 
end
