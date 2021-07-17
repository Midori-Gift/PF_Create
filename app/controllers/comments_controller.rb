# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @great = Great.find(params[:great_id])
    @great_comment = current_user.comments.new(great_comment_params)
    @great_comment.great_id = @great.id
    @great_comment.save!
    @great_comment = Comment.new
    # redirect_to request.referer
  end

  def destroy
    @great_comment = Comment.find_by(id: params[:id], great_id: params[:great_id])
    @great = @great_comment.great
    # great_comment.destroy
    # redirect_to great_path(@great.id)
    @great_comment.destroy!
    @great_comment = Comment.new
    # redirect_to request.referer
  end

  private

  def great_comment_params
    params.require(:comment).permit(:comment)
  end
end
