class ItemsController < ApplicationController
  # authorize_resource
  def index
    @items = Item.all
    @with_pic = @items.select do |item|
      item.picture.attached?
    end
    @random_items = @with_pic.sample(9)
  end

  def new
    authenticate_user!
    @item = Item.new
    @categories = Category.all
  end
  def show
    @item = Item.find(params[:id])
    @item_review = ItemReview.new
    @seller = @item.user
    @average_seller_rating = @seller.average_seller_rating
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      flash[:success] = "Item was updated"
      redirect_to @item
    else
      flash[:danger] = "Item was not updated"
      render 'edit'
    end
  end

  def create
    @item = Item.new
    @item.name = item_params[:name]
    @item.price = item_params[:price]
    @item.description = item_params[:description]
    @item.condition = item_params[:condition]
    @item.category_id = item_params[:category_id]
    @item.picture.attach(item_params[:picture]) 
    @item.user_id = current_user.id
    if @item.save
      flash[:success] = "Item is successfully created"
      redirect_to @item
    else
      render 'new'
    end
  end

  def delete
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.delete
      flash[:dangerDelete] = "Item was deleted"
      redirect_to items_path
    else
      render 'delete'
    end
  end

  private

  def item_params
    params.permit(:category_id, :brand, :model, :release_year, :version, :name, :description, :price, :number_in_stock, :in_stock, :serial_number, :item_location, :condition, :pick_up, :delivery, :picture)
end
end
