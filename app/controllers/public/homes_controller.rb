class Public::HomesController < ApplicationController

  def about
    @games = Game.all
  end
end
