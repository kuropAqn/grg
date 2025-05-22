class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :ensure_correct_user, only: [:edit, :create, :update, :destroy]


  def create
    @review = Review.find(params[:review_id])
    @comment = current_user.comments.new(comment_params)
    @comment.review_id = @review.id
    if @comment.save
      redirect_back fallback_location: games_path, notice: "コメントを投稿しました"
    else
      flash[:alert] = @comment.errors.full_messages.join("、")
      redirect_back fallback_location: games_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back fallback_location: games_path, notice: "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_body)
  end

  # def ensure_correct_user
  #   @comment = Comment.find(params[:id])
  #   unless @comment.user_id == current_user.id
  #     redirect_back fallback_location: games_path, alert: "他のユーザーのコメントは削除できません"
  #   end
  # end

end
