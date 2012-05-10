#coding: utf-8

class PagesController < ApplicationController
  def home
    @title = "Главная"
  end

  def contact
    @title = "Контакты"
  end
  
  def about
    @title = "О нас"
  end
  
  def help
    @title = "Помощь"
  end
end
