class CartsController < ApplicationController
  def add
    menu = MenuItem.find(params[:id])

    # Create cart if empty
    session[:cart] ||= {}

    # Convert menu.id to string because session uses strings
    item = session[:cart][menu.id.to_s] ||= { "name" => menu.name, "price" => menu.price, "qty" => 0 }

    # Increase quantity
    item["qty"] += 1

    redirect_back fallback_location: root_path
  end
end
