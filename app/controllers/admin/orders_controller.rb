class Admin::OrdersController < Admin::ApplicationController
  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result(distinct: true)
      .order(created_at: :desc, id: :desc)
      .page(params[:page])
      .per(20)
  end
end
