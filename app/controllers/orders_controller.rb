class OrdersController < ApplicationController
  def create
    cart = session[:cart] || {}

    if cart.empty?
      redirect_to root_path, alert: "Your cart is empty" and return
    end
    total_price = cart.sum { |_, item| item["qty"] * item["price"]}

    order = Order.create!(total_price: total_price, status: "success")

    #create each order item
    cart.each do |menu_item_id, item |
      OrderItem.create!(
        order: order,
        menu_item_id: menu_item_id,
        qty: item["qty"],
        price: item["qty"] * item["price"],
      )
    end

    # clear cart
    session[:cart] = {}
      flash[:notice] = "Transaction Success"
    redirect_to root_path
  end
end
