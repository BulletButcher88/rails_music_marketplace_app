class TransactionsController < ApplicationController
# before_action :authenticate_user!
# authorize_resource

def index
end

def show
  @transaction = Transaction.find(params[:id])
  @item = @transaction.item_id
  @buyer = @transaction.buyer
  @seller = @transaction.seller
end

def new
  authenticate_user!
  @item = Item.find(params[:item_id])
  @transaction = Transaction.new
end

def create
  @item = Item.find(params[:item_id])
  @transaction = Transaction.new(transaction_params)
  @transaction.user_id = current_user.id
  @buyer = current_user
  if @buyer.buyer_id == nil then @buyer.buyer_id = @buyer.id end
    @buyer.save
  @transaction.buyer_id = @buyer.buyer_id
  @seller = @item.user
  if @seller.seller_id == nil then @seller.seller_id = @seller.id end
    @seller.save
  @transaction.seller_id = @seller.seller_id
  @transaction.seller_id = @item.user_id
  @transaction.total = @item.price
  @transaction.total_in_cents = @transaction.convert_to_cents
  if @transaction.save
    redirect_to new_transaction_charge_path(@transaction)
  else
    render "new"
  end
end

private
def transaction_params
  params.permit(:item_id, :pick_up_address, :delivery_address, :pick_up, :delivery)
end

end