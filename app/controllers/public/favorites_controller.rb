class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.new(review_id: @review.id)
    favorite.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(review_id: @review.id)
    favorite.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def favorite_params
    params.require(:favorite).permit(:review_id, :user_id)
  end
end
