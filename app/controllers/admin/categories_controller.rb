class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_category

  def index
    @q = Category.ransack(params[:q])
    @categories = @q.result(distinct: true)
               .order(created_at: :desc, id: :desc) # Stable sort
               .page(params[:page]).per(10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: "Category was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def edit
  end

  def destroy
    @category.destroy!
    redirect_to admin_categories_path, notice: "category was Delete."
  end

  def show
  end

  private

  def set_category
    @category = Category.find(params[:id]) if params[:id]
    @category ||= Category.new
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.expect(category: [ :name ])
  end
end
