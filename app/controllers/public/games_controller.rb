class Public::GamesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @games = Game.all
    @genres = Genre.all
  end

  def show
    @game = Game.find(params[:id])
    @review = Review.new
    @reviews = @game.reviews
    @btntxt = "レビューを投稿する"
    # @average_score = @game.reviews.average(:score).to_f
  end

end