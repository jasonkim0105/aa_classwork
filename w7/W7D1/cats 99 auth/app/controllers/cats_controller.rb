class CatsController < ApplicationController

  before_action :require_i_own_this_cat, only: [:edit, :update]

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    puts "this is the cats_controller"
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id    # does this even work?
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit

  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  def require_i_own_this_cat
    @cat = Cat.find_by(id: params[:id])
    user_id = current_user.id
    cat_user_id = @cat.user_id
    redirect_to cats_url unless user_id == cat_user_id
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex, :user_id)
  end
end
