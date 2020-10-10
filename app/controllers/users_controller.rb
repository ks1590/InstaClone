class UsersController < ApplicationController
  # before_action :authenticate_user!, except: [:index]
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path
    end
  end

  def account
    @user = User.find(params[:id])
  end

  def confirm
  end

  def update
    @user = current_user.users.build(user_params)
    if @user.update(user_params)
      flash[:success] = "Profile updated"
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

  private
  def user_params
    params.require(:user).permit(:id, :name, :email, :password,
                                :password_confirmation, :image, :image_cache)
  end
end
