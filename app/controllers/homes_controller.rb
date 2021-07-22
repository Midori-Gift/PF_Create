# frozen_string_literal: true

class HomesController < ApplicationController
  
  # TOPページでいいね数上位の投稿3つを表示
  def top
    @great_rank = Great.find(Favorite.group(:great_id).order('count(great_id) desc').limit(3).pluck(:great_id))
  end

  def about
    @great_search = Great.where(is_release: true)
  end
end
