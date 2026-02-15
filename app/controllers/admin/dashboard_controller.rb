class Admin::DashboardController < Admin::ApplicationController
  def index
    @orders = Order.all
    @categories = Category.all

    @sales_by_day = Order.group_by_day(:created_at, range: 30.days.ago..Time.now).sum(:total_price)
    # @sales_by_category = Category.joins(menu_items: :order_items)
    #                              .group(:id, :name)
    #                              .sum("order_items.quantity * menu_items.price")
# #    @order_by_category = Category.joins(menu_items: :order_items)
#                                  .group(:id, :name)
#                                  .count("DISTINCT order_items.order_id")

    #@revenue_by_day = Order.group_by_day(:created_at, range: 30.days.ago..Time.now).sum(:total_price)
    @revenue_by_day = Order.where(created_at: 30.days.ago..Time.now).group_by_day(:created_at).sum(:total_price)

    @top_orders = Order.order(created_at: :desc).limit(5)


  end
end
