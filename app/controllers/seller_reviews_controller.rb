# frozen_string_literal: true

class SellerReviewsController < ApplicationController
  # authorize_resource

  def new
    @seller_review = SellerReview.new
    @transaction = Transaction.find(params[:transaction_id])
  end

  def create
    @seller_review = SellerReview.new
    @transaction = Transaction.find(params[:transaction_id])
    @seller_review.user_id = current_user.id
    @seller_review.transaction_id = params[:transaction_id]
    @seller_review.seller_id = @transaction.seller.id
    @seller_review.buyer_id = @transaction.buyer.id
    @seller_review.seller_review_content = params[:seller_review][:seller_review_content]
    @seller_review.rate_seller = params[:seller_review][:rate_seller].to_i
    @seller_review.save
    redirect_to @transaction.item
  end

  def edit
    @seller_review = SellerReview.find(params[:id])
  end

  def update
    item = Item.find(params[:item_id])
    seller_review = SellerReview.find(params[:id])
    seller_review.rate_seller = params[:rating]
    seller_review.seller_review_content = params[:seller_review_content]
    seller_review.save
    redirect_to item_path(item.id)
  end
  # add a comment

  def destroy
    @item = Item.find(params[:item_id])
    seller_review = SellerReview.find(params[:id])
    seller_review.delete
    redirect_to :root
  end

  private

  # def seller_review_params
  #   params.permit([:seller_review][:seller_review_content], [:seller_review][:rate_seller].to_i, :user_id, :transaction_id, :id)
  # end
end
