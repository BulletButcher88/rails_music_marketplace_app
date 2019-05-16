# frozen_string_literal: true

class BuyerReviewsController < ApplicationController
  # authorize_resource

  def new
    @buyer_review = BuyerReview.new
    @transaction = Transaction.find(params[:transaction_id])
  end

  def create
    @buyer_review = BuyerReview.new
    @transaction = Transaction.find(params[:transaction_id])
    @buyer_review.user_id = current_user.id
    @buyer_review.transaction_id = params[:transaction_id]
    @buyer_review.seller_id = @transaction.seller.id
    @buyer_review.buyer_id = @transaction.buyer.id
    @buyer_review.buyer_review_content = params[:buyer_review][:buyer_review_content]
    @buyer_review.rate_buyer = params[:buyer_review][:rate_buyer].to_i
    @buyer_review.save
    redirect_to @transaction.item
  end

  def edit
    @buyer_review = BuyerReview.find(params[:id])
  end

  def update
    item = Item.find(params[:item_id])
    buyer_review = BuyerReview.find(params[:id])
    buyer_review.rate_buyer = params[:rating]
    buyer_review.buyer_review_content = params[:buyer_review_content]
    buyer_review.save
    redirect_to item_path(item.id)
  end
  # add a comment

  def destroy
    @item = Item.find(params[:item_id])
    buyer_review = BuyerReview.find(params[:id])
    buyer_review.delete
    redirect_to :root
  end

  private

  def buyer_review_params
    params.permit(:buyer_review_content, :rate_buyer, :user_id, :transaction_id, :id)
  end
end
