#coding: utf-8

module ApplicationHelper

  def logo
    image_tag("logo.gif", :alt => "Система электронного документооборота воинской части", :class => "round")
  end
  
  # Return a title on a per-page basis.
  def title
    base_title = "Система электронного документооборота воинской части"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
