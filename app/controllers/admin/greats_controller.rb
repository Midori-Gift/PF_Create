# frozen_string_literal: true

class Admin::GreatsController < ApplicationController
  def index
    @greats = Great.all
  end

  def edit
    @great = Great.find(params[:id])
    @tag_list = @great.tags.pluck(:name).join(',')
  end

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
  
  # 投稿の公開非公開と非公開を管理する。(ユーザーは触ることが無い)
  
  def release
    @great = Great.find(params[:id])
    if @great.is_release == true
      @great.update(is_release: false)
    else
      @great.update(is_release: true)
    end
    redirect_to request.referer
  end

  private

  def great_params
    params.require(:great).permit(:is_release, :great_image, :name, :word, :tag_id, :head, :topic, :recommend)
  end
end
