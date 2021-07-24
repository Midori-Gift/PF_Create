# frozen_string_literal: true

class HomesController < ApplicationController

  # TOPページでいいね数上位の投稿3つを表示
  def top
    @great_rank = Great.joins(:favorites).where(is_release: 1).group(:id).order('count(*) desc').limit(3)
  end

  def about
  end
end
