class RequestsController < ApplicationController
  def index
    @requests_received = current_user.requests_as_owner.map do |request|
      request_unread = request.messages.select {|message| message.user != current_user}.any? { |message| !message.read }

      {request: request, request_unread?: request_unread}
    end

    @requests_sent = current_user.requests
  end

  def show
    @request = Request.find(params[:id])
    # Setting unread messages to read
    # Loop through each message in specific request
    # For each unread, set to read
    @message = Message.new
    @request.messages.each do |message|
      message.read = true
      message.save
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @request = Request.new

    @request.item = @item
    @request.user = current_user
    @request.status = :pending

    if @request.save
      # Redirect to the request's show page (or wherever appropriate) upon successful creation
      redirect_to request_path(@request), notice: 'Request was successfully sent.'
    else
      # Re-render the new form if validation fails
      render "items/show", status: :unprocessable_entity
      @item
    end
  end

  def update
    @request = Request.find(params[:id])

    if @request.update(request_params)

      # Redirect to the request's show page (or wherever appropriate) upon successful creation
      redirect_to request_path(@request), notice: 'Request was successfully sent.'
    end
  end

  private
  def request_params
    # params["request"]["available_times"] = params["request"]["available_times"].drop(0)
    params["request"]["available_times"] = params["request"]["available_times"].compact_blank
    params.require(:request).permit(:pickup_date, available_times:[])

  end
end
