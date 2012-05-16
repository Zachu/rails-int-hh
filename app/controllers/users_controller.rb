class UsersController < ApplicationController
  
  skip_before_filter :authorize, only: [:new, :create]

  before_filter :find_user, only: [:edit, :update, :show]

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.locale = 'en'
    if @user.save
      UserMailer.welcome_email(@user).deliver
      flash[:notice] = "Welcome!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Settings saved"
      redirect_to root_path
    else
      render action: :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end


end
