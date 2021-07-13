class FavoritesController < ApplicationController
  def create
    @great = Great.find(params[:great_id])
    @favorite = current_user.favorites.new(great_id: @great.id)
    @favorite.save
  end

  def destroy
    @great = Great.find(params[:great_id])
    @favorite = current_user.favorites.find_by(great_id: @great.id)
    @favorite.destroy
  end
end
