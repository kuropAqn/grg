class Public::GamesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @games = Game.all
    @genres = Genre.all
    @game = Game.includes(:reviews)
    @average_ratings = @games.each_with_object({}) do |game, hash|
      hash[game.id] = game.reviews.average(:star)&.round(1) || 0
    end
  end

  def show
    @game = Game.find(params[:id])
    @review = Review.new
    @reviews = @game.reviews
    @btntxt = "投稿"
    @review_avg = @game.reviews.average(:star)
  end

end