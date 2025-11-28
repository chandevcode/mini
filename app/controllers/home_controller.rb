class HomeController < ApplicationController
  def index
    @menus = MenuItem.where(is_available: true).order(created_at: :desc)
  end
end
