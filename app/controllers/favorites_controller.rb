# frozen_string_literal: true

class FavoritesController < ApplicationController

  # いいねといいねの取り消しが目的、非同期通信化のためredirect_toの記述は無し。

  def create
    @great = Great.find(params[:great_id])
    @favorite = current_user.favorites.new(great_id: @great.id)
    @favorite.save!
  end

  def destroy
    @great = Great.find(params[:great_id])
    @favorite = current_user.favorites.find_by(great_id: @great.id)
    @favorite.destroy!
  end
end
