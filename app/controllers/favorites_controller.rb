# frozen_string_literal: true

class FavoritesController < ApplicationController
  def create
    # @greats = params[:tag_id].present? ? Tag.find(params[:tag_id]).great : Great.where(is_release: true)
    # @great_rank = @greats.includes(:favorited_users).sort { |a, b| b.favorited_users.size <=> a.favorited_users.size }

    # #　上記は非同期通信の際、ランキング機能を維持するための記述
    @great = Great.find(params[:great_id])
    @favorite = current_user.favorites.new(great_id: @great.id)
    @favorite.save!
  end

  def destroy
    # @greats = params[:tag_id].present? ? Tag.find(params[:tag_id]).great : Great.where(is_release: true)
    # @great_rank = @greats.includes(:favorited_users).sort { |a, b| b.favorited_users.size <=> a.favorited_users.size }

    # #　上記は非同期通信の際、ランキング機能を維持するための記述
    @great = Great.find(params[:great_id])
    @favorite = current_user.favorites.find_by(great_id: @great.id)
    @favorite.destroy!
  end
end
