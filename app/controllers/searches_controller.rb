class SearchesController < ApplicationController

  def search
    @query = params[:query]
    @search_type = params[:search_type]
    @match_type = params[:match_type] || 'exact'

    if @search_type == 'User'
      @results = User.search_by_name(@query, @match_type)
    elsif @search_type == 'Game'
      @results = Game.search_by_title(@query, @match_type)
      @pub_results = Game.search_by_title(@query, @match_type)
    elsif @search_type == 'Genre'
      genre = Genre.search_by_genre(@query, @match_type).first
      if genre
        @results = genre.games
      else
        @results = []
      end
      @pub_results = @results
    else
      @results = []
    end

    render 'searches/search_results'
  end
end