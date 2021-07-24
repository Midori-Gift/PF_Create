# frozen_string_literal: true

class GreatsController < ApplicationController

  def new
    @great = Great.new
  end

  # createアクションは投稿の保存が完了したなら、タグの保存ををする

  def create
    @great = Great.new(great_params)
    @great.user_id = current_user.id
    tag_list = params[:great][:tag_ids].split(',')

    if @great.save
      @great.save_tags(tag_list)
      flash[:notice] = '投稿が完了しました。'
      redirect_to great_path(@great.id)
    else
      render 'new'
    end
  end

  def search
    @great = Great.where(is_release:true).search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  # @greats はタグ検索の表示、@great_rank はランキング機能用

  def index
    @greats = params[:tag_id].present? ? Tag.find(params[:tag_id]).great: Great.where(is_release: true)
    @great_rank = @greats.includes(:favorited_users).sort { |a, b| b.favorited_users.size <=> a.favorited_users.size }
  end

  def show
    @great = Great.find(params[:id])
    @great_comment = Comment.new
  end

  def edit
    @great = Great.find(params[:id])
    @tag_list = @great.tags.pluck(:name).join(',')
  end

  # createアクション同様、投稿の更新後にタグの保存を行っている。

  def update
    @great = Great.find(params[:id])
    tag_list = params[:great][:tag_ids].split(',')

    if @great.update(great_params)
      @great.save_tags(tag_list)
      redirect_to great_path(@great.id)
    else
      render 'edit'
    end
  end

  def destroy
    great = great.find(paramas[:id])
    great.destroy
    redirect_to greats_path
  end

  private

  def great_params
    params.require(:great).permit(:great_image, :name, :word, :tag_id, :head, :topic, :recommend)
  end
end
