class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def top_ideas
  	@pins = Pin.all.order(:cached_votes_up => :desc)
  end
end
