class HomesController < ApplicationController
  def top
    @user = current_user.id
    @greats = Great.where(is_release: true)
    # @great_rank = @greats.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @great_rank = Great.find(Favorite.group(:great_id).order('count(great_id) desc').limit(3).pluck(:great_id))
  end

  def about
  end
end
