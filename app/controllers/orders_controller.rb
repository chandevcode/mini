class OrdersController < ApplicationController
  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result(distinct: true)
      .order(created_at: :desc)
      .page(params[:page])
      .per(20)
  end

  def create
    cart = session[:cart] || {}

    if cart.empty?
      redirect_to root_path, alert: "Your cart is empty" and return
    end
    total_price = cart.sum { |_, item| item["qty"] * item["price"] }

    order = Order.create!(total_price: total_price, status: "success", table_number: params[:table_number], order_type: params[:order_type], payment_method: params[:payment_method])

    # create each order item
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
  def show
    @order = Order.find(params[:id])
    # Optional: Add authorization (e.g., only allow owner to view)
    # redirect_to orders_path, alert: "Not authorized" unless @order.user == current_user
  end
end
