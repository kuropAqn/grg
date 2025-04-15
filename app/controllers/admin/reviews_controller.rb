class Admin::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path, notice: "レビューを削除しました"
  end

  private
  def review_params
    params.require(:review).permit(:game_id, :user_id, :title, :star, :body)
  end

end
