class PagesController < ApplicationController
  def index
    smell_tags = Strain.tag_counts_on(:smells)
    taste_tags = Strain.tag_counts_on(:tastes)
    @tags = smell_tags + taste_tags
  end

  def about
    @title = 'About'
  end

end
