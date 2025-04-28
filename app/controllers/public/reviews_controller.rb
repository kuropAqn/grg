class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]


  def index
    @review = Review.new
    @game = Game.find(params[:game_id])
  end

  def show
    @comment = Comment.new
    @comments = Comment.all
    @btntxt = '投稿'
    @review = Review.find(params[:id])
    @game = Game.find(@review.game_id)
    @user = User.find(@review.user_id)
    @reviews_from_user = Review.where(user_id: @user.id)
  end

  def edit
    @btntxt = "更新"
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
    unless @review.user_id == current_user.id
      redirect_to game_reviews_path(@game), alert: "他のユーザーのレビューは編集できません"
    end
  end

  def create
    @game = Game.find(params[:game_id])
    @review = current_user.reviews.new(review_params)
    @review.game_id = @game.id
    if @review.save
      redirect_to game_path(@game), notice: "レビューを投稿しました"
    else
      redirect_to game_path(@game), alert: "レビューの投稿に失敗しました"
    end
  end

  def update
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to game_path(@game), notice: "レビューを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to game_path(@game), notice: "レビューを削除しました"
  end

  def ensure_correct_user
    @review = Review.find(params[:id])
    unless @review.user_id == current_user.id
      redirect_to game_path(@review.game_id), alert: "他のユーザーのレビューは編集できません"
    end
  end

  private
  def review_params
    params.require(:review).permit(:star, :title, :body, :review_image)
  end

end
