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
    @user = current_user.id
    @greats = Great.all
  end

  def show
    @great = Great.find(params[:id])
    @great_comment = Comment.new
  end

  def edit
    @great = Great.find(params[:id])
    @tag_list = @great.tags.pluck(:name).join(",")
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
