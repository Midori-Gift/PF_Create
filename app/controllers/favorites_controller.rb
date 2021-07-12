class FavoritesController < ApplicationController
  def create
    great = Great.find(params[:great_id])
    favorite = current_user.favorites.new(great_id: great.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    great = Great.find(params[:great_id])
    favorite = current_user.favorites.find_by(great_id: great.id)
    favorite.destroy
    redirect_to request.referer
  end
end
