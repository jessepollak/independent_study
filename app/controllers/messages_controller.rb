class MessagesController < ApplicationController

    def index
    @messages = Message.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  def new
  	@message = Message.new
    @request = Request.find(params[:request_id])
  	respond_to do |format|
      format.html
      format.json { render json: @message }
    end
  end

  def create
    @message = Message.new(params[:message])
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Thank you! Your message has been sent.' }
        format.json { render json: @message, status: :created, location: @message}
      else
          @request = Request.find(@message.request_id)
          format.html { render template: 'requests/show' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @message }
    end
  end

end