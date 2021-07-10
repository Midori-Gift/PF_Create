class GreatsController < ApplicationController
  def new
    @great = Great.new
  end

  def create
    @great = Great.new(great_params)
    @great.user_id = current_user.id
    tag_list = params[:great][:tag_ids].split(',')
    #debugger
    if @great.save
      @great.save_tags(tag_list)
      redirect_to great_path(@great.id)
    else
      render 'new'
    end
  end

  def index
    @greats = Great.all
  end

  def show
    @great = Great.find(params[:id])
  end

  def edit
    @great = Great.find(params[:id])
  end

  def update
    great = great.find(params[:id])
    great.update(great_params)
    redirect_to great_path(great.id)
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
