# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper
  
  # output a title for the page
  def title_for_layout
    if @title.nil?
      "Cannibook"
    else
      "#{@title} &ndash; Cannibook"
    end
  end
  
  # outputs true or false whether the page is the current_page
  def current?(controller_name, action_name = nil)
    if current_page?(:controller => controller_name, :action => action_name)
      'current'
    else
      nil
    end
  end
  
  # get the name of the controller and output it for the body tags id paramater
  def id_for_body
    id = request[:controller].to_s
    " id=\"#{id}\""
  end
  
  # call this in a view file to add your javascript files to the head of the document
  # instead of the body of the document
  def add_js_files(*files)
    content_for(:extra_js_files) do
      files.collect { |file| javascript_include_tag(file) + "\n  " }
    end
  end
  
  # call this in a view file to add your javascript source to the head of the document
  # instead of the body of the document
  def add_js_source(source)
    content_for(:extra_js_source) { source }
  end
end
