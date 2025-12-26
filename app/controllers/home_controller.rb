class HomeController < ApplicationController
  def index
    # @menus = MenuItem.where(is_available: true).order(created_at: :desc)
    @q = MenuItem.ransack(params[:q])
    # @menus = MenuItem.all
    @menus = @q.result.includes(:category).order(created_at: :desc)
               .page(params[:page]).per(9)
  end
end
