class Admin::TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def index
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      #notice: 'タグを作成しました'
      redirect_to new_admin_tag_path 
    else
      #flash.now[:alert] = '作成に失敗しました'
      render :new
    end
  end

  def update
    @tag = Tag.find(params[:id])
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
end