class Admin::GreatsController < ApplicationController
  def edit
    @great = Great.find(params[:id])
  end

  def update
    @great = Great.find(params[:id])
    if @great.update(great_params)
      redirect_to '/'
    else
      render :edit
    end
  end

  def release
    @great = Great.find(params[:id])
    if @great.is_release == false
      @great.update(is_release: true)
    else
      @great.update(is_release: false)
    end
      redirect_to request.referer
  end


  private

  def great_params
    params.require(:great).permit(:is_release, :great_image, :name, :word, :tag_id, :head, :topic, :recommend)
  end
end
