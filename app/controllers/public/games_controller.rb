class Public::GamesController < ApplicationController
  def index
    @games = Game.all
    @genres = Genre.all
  end

  def show
    @game = Game.find(params[:id])
    @review = Review.new
    @reviews = @game.reviews.includes(:user)
    @btntxt = "レビューを投稿する"
    # @average_score = @game.reviews.average(:score).to_f
  end

end