class Admin::GamesController < ApplicationController
  def index
    @games = Game.all
    @game = Game.new
    @btntxt = "新規登録"
  end

  def show
    @game = Game.find(params[:id])
    # @game_reviews = @game.reviews
    @game_review = Review.new
  end

  def edit
    @game = Game.find(params[:id])
    @btntext = "更新"
  end

  def new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice] = "新規登録が完了しました"
      redirect_to admin_game_path(@game.id)
    else
      flash.now[:alert] = "新規登録に失敗しました"
      render :new
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice] = "更新が完了しました"
      redirect_to admin_game_path(@game.id)
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    if @game.destroy
      flash[:notice] = "ゲームを削除しました"
      redirect_to admin_games_path
    else
      flash.now[:alert] = "削除に失敗しました"
      render :index
    end
  end


  private

  def game_params
    params.require(:game).permit(:title, :body, :price, :genre_id)
  end

end
