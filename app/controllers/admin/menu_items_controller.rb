class Admin::MenuItemsController < Admin::ApplicationController
  before_action :set_menu_item

  def index
    @q = MenuItem.ransack(params[:q])
    @menu_items = @q.result(distinct: true)
               .includes(:category)
               .order(created_at: :desc, id: :desc) # Stable sort
               .page(params[:page]).per(10)
  end

  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)

    if @menu_item.save
      redirect_to admin_menu_items_path, notice: "Menu item was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to admin_menu_items_path, notice: "Menu item was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def edit
  end

  def destroy
    @menu_item.destroy
    redirect_to admin_menu_items_path, notice: "Menu item was Delete."
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id]) if params[:id]
    @menu_item ||= MenuItem.new
  end

  # Only allow a list of trusted parameters through.
  def menu_item_params
    params.expect(menu_item: [ :category_id, :name, :description, :price, :is_available ])
  end
end
