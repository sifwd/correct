class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy
  
  def new
    if signed_in?
      redirect_to root_path
      flash[:error] = "You can't sign up again!"
    else
      @user = User.new
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      # success!
       sign_in @user
       flash[:success] = "Signup Complete. Welcome to the App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page], :per_page => 25)
  end
  
  def edit
  end
  
  def update 
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User DESTROYED!"
    redirect_to users_path
  end
  
  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
