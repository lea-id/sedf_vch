class OrderSentsController < ApplicationController
  before_filter :authenticate_user!

  #load_and_authorize_resource

  # GET /orders/1/ordersents
  def index
    # For URL like /orders/1/ordersents
    # Get the order with id=1
    @order = Order.find(params[:order_id])

    # Access all ordersents for that order
    @ordersents = @order.order_sents
  end

  # GET /orders/1/ordersents/2
  def show
    @order = Order.find(params[:order_id])

    # For URL like /orders/1/ordersents/2
    # Find an ordersent in orders 1 that has id=2
    @ordersent = @order.order_sents.find(params[:id])
  end

  # GET /orders/1/ordersents/new
  def new
    @order = Order.find(params[:order_id])

    # Associate an ordersent object with order 1
    @ordersent = @order.order_sents.build
  end

  # POST /orders/1/ordersents
  def create
    @order = Order.find(params[:order_id])

    # For URL like /orders/1/ordersents
    # Populate an ordersent associate with order 1 with form data
    # order will be associated with the ordersent
    @ordersent = @order.order_sents.build(params[:order_sent])
    if @ordersent.save
      # Save the ordersent successfully
      redirect_to order_order_sent_url(@order, @ordersent)
    else
      render :action => "new"
    end
  end

  # GET /orders/1/ordersents/2/edit
  def edit
    @order = Order.find(params[:order_id])

    # For URL like /orders/1/ordersents/2/edit
    # Get ordersent id=2 for order 1
    @ordersent = @order.order_sents.find(params[:id])
  end

  # PUT /orders/1/ordersents/2
  def update
    @order = Order.find(params[:order_id])
    @ordersent = OrderSent.find(params[:id])
    if @ordersent.update_attributes(params[:order_sent])
      # Save the ordersent successfully
      redirect_to order_order_sent_url(@order, @ordersent)
    else
      render :action => "edit"
    end
  end

  # DELETE /orders/1/ordersents/2
  def destroy
    @order = Order.find(params[:order_id])
    @ordersent = OrderSent.find(params[:id])
    @ordersent.destroy

    respond_to do |format|
      format.html { redirect_to order_order_sents_path(@order) }
      format.xml  { head :ok }
    end
  end
end
