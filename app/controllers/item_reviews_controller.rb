class ItemReviewsController < ApplicationController
  # authorize_resource

  def new
    @item = Item.find(params[:item_id])
    @review = ItemReview.new
  end

  def create
    @item = Item.find(params[:item_id])
    @review = @item.item_reviews.create(item_review_params)
    @review.user_id = current_user.id
    @review.item_review_content = params[:item_review][:item_review_content]
    @review.rate_item = params[:item_review][:rate_item].to_f
    @review.save
    redirect_to item_path(@item.id)
  end

  def edit
    @item = Item.find(params[:item_id])
    @item_review = ItemReview.find(params[:id])
  end

  def update
    @item = Item.find(params[:item_id])
    @review = ItemReview.find(params[:id])
    
    if @review.update(item_review_params)
      redirect_to @item
    else
      render 'edit'
    end
  end
  # add a comment

  def delete
    @item = Item.find(params[:item_id])
    @review = ItemReview.find[:id]
  end 

  def destroy
    @item = Item.find(params[:item_id])
    @review = ItemReview.find(params[:id])
    if @review.delete
      redirect_to @item
    else
      render 'delete'
    end
  end

  private

  def item_review_params
    params.permit(:item_review_content, :rate_item, :user_id, :transaction_id, :item_id, :id)
  end
end
