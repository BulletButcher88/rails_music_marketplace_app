class ChargesController < ApplicationController
  before_action :authenticate_user!
  
  def new 
    @transaction = Transaction.find(params[:transaction_id])
    @item = @transaction.item
  end

  def success
    @transaction = current_user.purchases.last
    @item = @transaction.item
    @item_review = @item.item_reviews.create
    @seller_review = @transaction.buyer.review_buyer.create
  end 

  def create
    begin
      @transaction = Transaction.find(params[:transaction_id])
      @item = @transaction.item
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken]
    })

      Stripe::Charge.create({
        customer: customer.id,
        amount:   @transaction.total_in_cents,
        description: 'Octave Customer',
        currency: 'aud'
      })
    redirect_to transaction_successful_charge_path
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_transaction_charge_path
    end 
  end
end