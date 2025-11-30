class Admin::MenuItemsController < ApplicationController
  def index
    @q = MenuItem.ransack(params[:q])
    @menu_items = @q.result.includes(:category).order(created_at: :desc)
  end

  def new
  end

  def edit
  end
end
