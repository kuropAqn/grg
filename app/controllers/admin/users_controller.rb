class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @games = Game.where(user_id: @user.id)
    @reviews = Review.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザー情報を更新しました"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end

end
