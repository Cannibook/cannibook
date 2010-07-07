# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title_for_layout
    if @title.nil?
      "Cannibook"
    else
      "#{@title} &ndash; Cannibook"
    end
  end
end
