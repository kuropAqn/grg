class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
    @btntxt = "新規登録"
  end

  def edit
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    @btntxt = "更新"
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "新規登録が完了しました"
      redirect_to admin_genres_path
    else
      flash.now[:alert] = "新規登録に失敗しました"
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "更新が完了しました"
      redirect_to admin_genres_path
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
