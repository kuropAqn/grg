class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = current_user
    @games = Game.all
    @reviews_from_user = @user.reviews
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_path, notice: '情報を更新しました。'
    else
      render :edit
    end
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
