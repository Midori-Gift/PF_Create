class CommentsController < ApplicationController
  def create
    great = Great.find(params[:great_id])
    comment = current_user.comments.new(great_comment_params)
    comment.great_id = great.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    # great_comment = Comment.find(params[:id])
    # great_comment.destroy
    # redirect_to great_path(@great.id)
    Comment.find_by(id: params[:id], great_id: params[:great_id]).destroy
    redirect_to request.referer
  end

  private

  def great_comment_params
    params.require(:comment).permit(:comment)
  end
end
